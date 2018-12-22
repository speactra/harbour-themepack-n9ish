#include "themepack.h"
#include "spawner.h"
#include <unistd.h>
#include <QFileInfo>
#include <QDebug>

ThemePack::ThemePack(QObject* parent): QObject(parent)
{

}

QString ThemePack::whoami() const
{
    return Spawner::executeSync("whoami");
}

void ThemePack::fetchIcons() const
{
    Spawner::execute("/usr/share/harbour-themepack-n9ish/fetchicons.sh", [this]() { emit iconsFetched(); });
}
