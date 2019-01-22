QT       -= gui

TARGET = mylib
TEMPLATE = lib

DEFINES += MYLIB_LIBRARY

SOURCES += myLib.cpp

HEADERS += myLib.h\
        mylib_global.h

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
