# Creating the project structure

- Create a new "Other Project > Subdirs Project" called `subdir` in `~/src/` and get its build files into `~/src/qtsubdir-build/sources/`. Don't add it to any existing subproject.
- Create a new "Other Project > Subdirs Project" called `sources` in `~/src/qtsubdir/` and add it as a subproject to "qtsubdir"
- Create a new "Other Project > Subdirs Project" called `thirdparty` in `~/src/qtsubdir/sources` and add it as a subproject to "sources"
- Create a new "Libraries > C++ Library" as a "Shared Library" called `awesomelib` in `~/src/qtsubdir/sources/thirdparty/` and get its build files into `~/src/qtsubdir-build/sources/libraries/mylib/` and add it as a subproject to "thirdparty".
- Create a new "Other Project > Subdirs Project" called `libraries` in `~/src/qtsubdir/sources/` and add it as a subproject to "qtsubdir.pro.
- Create a new "Libraries > C++ Library" as a "Shared Library" called `mylib` in `~/src/qtsubdir/sources/library/` and add it as a subproject to "sources.pro.
- Create a new "Other Project > Subdirs Project" called `plugins` in `~/src/qtsubdir/sources/` and add it as a subproject to "sources.pro"
- Create a new "Other Project > Subdirs Project" called `load` in `~/src/qtsubdir/sources/plugins` and add it as a subproject to "plugins.pro"
- Create a new "Libraries > C++ Library" called `loadTxt` as a "Shared Library" in `~/src/qtsubdir/sources/plugins/load` and add it as a subproject to "load.pro".
- Create a new "Applications > Qt Console Application" called `application` in `~/src/qtsubdir/sources/` and add it as a subproject to "sources.pro".
- Create a new "Other Project > Empty Qt Project" called `subdirs` in `~/src/qtsubdir/sources/core` and add it as a subproject to "core.pro".
- "Add New" files to the subdirs project as "C++ > C++ Class", name it SubDirs, using "QApplication" as the base class and renaming the files as `subDirs.h` and `subDirs.cpp`.
- "Add New" file to the subdirs project as "General > Text File", name it subdirs.pri, add it to the subdirs project.
- move the content of the `subdirs.pro` file into `subdirs.pri` one and patch it as follows:
      INCLUDEPATH += $$PWD
      DEPENDPATH += $$PWD

      HEADERS += \
          $$PWD/subdirs.h

          SOURCES += \
              $$PWD/subdirs.cpp
- in the `core.pro` file, remove the `SUBDIRS` definition and add `include(subdirs/subdirs.pri)`, instead. You can now delete the `subdirs.pro` file


Now your project should look like this one:

![Project structure in Qt Creator](https://raw.github.com/aoloe/qtsubdir/project_creation/documentation/images/qtsubdir_project.png)

You should now be able to build the "subdir" project. This will create a directory `~/src/qtsubdir-build` (you defined that target directory in the first step above) with the following content:

    qtsubdir-build/
        Makefile
        application/
            Makefile
            reader/
                main.o
                Makefile
                reader
        sources/
            Makefile
            libraries/
                Makefile
                mylib/
                    libmylib.so
                    libmylib.so.1
                    libmylib.so.1.0
                    libmylib.so.1.0.0
                    Makefile
                    mylib.o
            plugins/
                Makefile
                load/
                    Makefile
                    loadTxt/
                        libloadTxt.so
                        libloadTxt.so.1
                        libloadTxt.so.1.0
                        libloadTxt.so.1.0.0
                        loadtxt.o
                        Makefile
            thirdparty/
                Makefile
                awesomelib/
                    awesomelib.o
                    libawesomelib.so
                    libawesomelib.so.1
                    libawesomelib.so.1.0
                    libawesomelib.so.1.0.0
                    Makefile
