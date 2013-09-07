#-------------------------------------------------
#
# Project created by QtCreator 2013-09-07T23:21:43
#
#-------------------------------------------------

QT       -= gui

TARGET = loadTxt
TEMPLATE = lib

DEFINES += LOADTXT_LIBRARY

SOURCES += loadtxt.cpp

HEADERS += loadtxt.h\
        loadtxt_global.h

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
