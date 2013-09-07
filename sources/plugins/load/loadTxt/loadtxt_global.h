#ifndef LOADTXT_GLOBAL_H
#define LOADTXT_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LOADTXT_LIBRARY)
#  define LOADTXTSHARED_EXPORT Q_DECL_EXPORT
#else
#  define LOADTXTSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // LOADTXT_GLOBAL_H
