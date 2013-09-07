#-------------------------------------------------
#
# Project created by QtCreator 2013-09-07T23:11:55
#
#-------------------------------------------------

QT       -= gui

TARGET = mylib
TEMPLATE = lib

DEFINES += MYLIB_LIBRARY

SOURCES += mylib.cpp

HEADERS += mylib.h\
        mylib_global.h

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
