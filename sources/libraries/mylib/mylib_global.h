#ifndef MYLIB_GLOBAL_H
#define MYLIB_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(MYLIB_LIBRARY)
#  define MYLIBSHARED_EXPORT Q_DECL_EXPORT
#else
#  define MYLIBSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // MYLIB_GLOBAL_H
