#ifndef THEMEPACK_H
#define THEMEPACK_H

#include <QObject>

class ThemePack : public QObject
{
    Q_OBJECT

    public:
        explicit ThemePack(QObject* parent = 0);

    public slots:
        QString whoami() const;                         // function to test what user runs app
        void fetchIcons() const;

    signals:
        void iconsFetched();
};

#endif // THEMEPACK_H

