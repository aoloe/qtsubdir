QT       += core

QT       -= gui

TARGET = application
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app

include(../core/subdir/subdir.pri)

SOURCES += main.cpp
