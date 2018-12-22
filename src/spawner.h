#ifndef SPAWNER_H
#define SPAWNER_H

#include <QObject>
#include <QProcess>
#include <QHash>
#include <functional>

#define setuid_ex(x) if(setuid(x)) { }
#define SPAWN_ARGS(...) (QStringList() << __VA_ARGS__)

class Spawner : public QObject
{
    Q_OBJECT

    private:
        explicit Spawner(QObject *parent = nullptr);

    public:
        static QString executeSync(const QString& cmd);
        static void execute(const QString& command, const QStringList& arguments, std::function<void()> done);
        static void execute(const QString& command, std::function<void()> done);

    private:
        static QHash< QProcess*, std::function<void()> > _callbackmap;
};

#endif // SPAWNER_H
