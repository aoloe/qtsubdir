#ifndef AWESOMELIB_GLOBAL_H
#define AWESOMELIB_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(AWESOMELIB_LIBRARY)
#  define AWESOMELIBSHARED_EXPORT Q_DECL_EXPORT
#else
#  define AWESOMELIBSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // AWESOMELIB_GLOBAL_H