TARGET = harbour-themepack-n9ish

MY_FILES = \
other/fetchicons.sh \
other/coverbg.png \
other/appinfo.png

OTHER_SOURCES += $$MY_FILES

my_resources.path = $$PREFIX/share/$$TARGET
my_resources.files = $$MY_FILES

themepack.files = theme/*
themepack.path = $$PREFIX/share/$$TARGET

INSTALLS += my_resources themepack

CONFIG += sailfishapp c++11

SOURCES += \
    src/spawner.cpp \
    src/themepack.cpp \
    src/main.cpp

OTHER_FILES += qml/harbour-themepack-n9ish.qml \
    qml/cover/CoverPage.qml \
    qml/components/*.qml \
    rpm/harbour-themepack-n9ish.changes \
    rpm/harbour-themepack-n9ish.spec \
    rpm/harbour-themepack-n9ish.yaml \
    harbour-themepack-n9ish.desktop \
    qml/pages/FirstPage.qml

SAILFISHAPP_ICONS = 86x86

CONFIG += sailfishapp_i18n

TRANSLATIONS +=  translations/*.ts

HEADERS += \
    src/spawner.h \
    src/themepack.h
