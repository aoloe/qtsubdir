#ifndef SUBDIRS_H
#define SUBDIRS_H

#include <QCoreApplication>

class SubDirs : public QCoreApplication
{
    Q_OBJECT
public:
    explicit SubDirs(int &argc, char **argv);
    int run();

signals:

public slots:
    
};

#endif // SUBDIRS_H
