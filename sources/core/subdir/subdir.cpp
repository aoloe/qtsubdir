#include "subdir.h"
#include <QCoreApplication>
#include <QDebug>

#include "subdir.h"
#include "mylib.h"

SubDirs::SubDirs(int &argc, char **argv) :
    QCoreApplication(argc, argv)
{
    // test();
}

int SubDirs::run()
{
    QString text = "this is a string";
    text = decorate(text, "****");
    // qDebug() << "chuila";
    return 0;
}
