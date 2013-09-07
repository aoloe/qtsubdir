#-------------------------------------------------
#
# Project created by QtCreator 2013-09-07T23:10:30
#
#-------------------------------------------------

QT       -= gui

TARGET = awesomelib
TEMPLATE = lib

DEFINES += AWESOMELIB_LIBRARY

SOURCES += awesomelib.cpp

HEADERS += awesomelib.h\
        awesomelib_global.h

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
