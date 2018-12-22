#include "spawner.h"
#include <QProcess>
#include <cstdio>
#include <string>

QHash< QProcess*, std::function<void()> > Spawner::_callbackmap;

Spawner::Spawner(QObject *parent) : QObject(parent)
{

}

QString Spawner::executeSync(const QString &cmd)
{
    FILE* pipe = popen(cmd.toUtf8().constData(), "r");
    if (!pipe) return "ERROR";
    char buffer[128];
    std::string result = "";

    while(!feof(pipe)) {
        if(fgets(buffer, 128, pipe) != NULL)
            result += buffer;
    }

    pclose(pipe);
    return QString::fromStdString(result).simplified();
}

void Spawner::execute(const QString &command, const QStringList &arguments, std::function<void ()> done)
{
    QProcess* p = new QProcess();

    connect(p, static_cast<void(QProcess::*)(int)>(&QProcess::finished), [p](int) {
        auto cb = _callbackmap[p];

        if(cb)
            cb();

        _callbackmap.remove(p);
        p->deleteLater();
    });

    _callbackmap[p] = done;
    p->setProcessChannelMode(QProcess::ForwardedChannels);
    p->start(command, arguments);
}

void Spawner::execute(const QString &command, std::function<void()> done)
{
    Spawner::execute(command, QStringList(), done);
}
