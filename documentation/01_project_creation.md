# Creating the basic project structure

- Create a new "Other Project > Subdirs Project" called `subdir` in `~/src/` and get its build files into `~/src/qtsubdir-build/`. Don't add it to any existing subproject.
- Create a new "Other Project > Subdirs Project" called `sources` in `~/src/qtsubdir/` and add it as a subproject to "qtsubdir". This directory will contain all the source code of your project.

# Creating the main application

First we create the `main.cpp`, which is the entry point for every C++ program.

- Create a new "Applications > Qt Console Application" called `application` in `~/src/qtsubdir/sources/` and add it as a subproject to "sources.pro".

As it is created by Qt Creator, this file creates and run a `QCoreApplication`.

We will extend it to run an instance of "our" `QCoreApplication` and to parse the command line arguments.

# - Create a new "Other Project > Subdirs Project" called `core` in `~/src/qtsubdir/sources` and add it as a subproject to "sources"
# - Create a new "Other Project > Empty Qt Project" called `subdirs` in `~/src/qtsubdir/sources/core` and add it as a subproject to "core.pro".
- Create a directory `core` in `~/src/qtsubdir/sources/` and then a directory `subdirs` inside it.
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


towards the the beginning of `sources/application/main.cpp` add
    #include <subdirs.h>

in order to get the `main.cpp` to find the header file, add 

    include(../core/subdirs/subdirs.pri)

in `sources/application/application.pro`

Now you can create the instance of `SubDirs` in `main.cpp`:

    int main(int argc, char *argv[])
    {
          QCoreApplication a(argc, argv);
              
                  return a.exec();
    }

If you run the resulting program -- which is placed in `~/src/qtsubdir-build/sources/application/application` -- you will get into some sort of infinite loop, that you can break with a `ctrl-c`.  
Indeed, Qt applications are event based and -- since we aren't generating any event -- the application won't ever quit by itself.  
Most console applications go through a specific workflow and don't react to events, so we won't for now produce a "faked" quit event and dismiss the `exec()` method.  
Instead, we implement a `run()` method in `SubDirs`, which will be called from `main.cpp`.

    int main(int argc, char *argv[])
    {
          QCoreApplication a(argc, argv);
              
                  return a.run();
    }

![Project structure in Qt Creator](https://raw.github.com/aoloe/qtsubdir/project_creation/documentation/images/qtsubdir_core_project.png)



# Add a library

A library contains code, organized in a structure way, that you will be able to call from the main code, other libraries or a plugin.

- Create a new "Other Project > Subdirs Project" called `libraries` in `~/src/qtsubdir/sources/` and add it as a subproject to "qtsubdir.pro.
- Create a new "Libraries > C++ Library" as a "Shared Library" called `mylib` in `~/src/qtsubdir/sources/library/` and add it as a subproject to "sources.pro. The class name will be `MyLib`, the files `myLib.h` and `myLib.cpp`


- Don't forget to add

      CONFIG   += ordered
  
  in `qtsubdir.pro` (or at least in `sources.pro`), otherwise it's not sure that the libraries are compiled before the core classes that need them.



# Add a plugin



- Create a new "Other Project > Subdirs Project" called `thirdparty` in `~/src/qtsubdir/sources` and add it as a subproject to "sources"
- Create a new "Libraries > C++ Library" as a "Shared Library" called `awesomelib` in `~/src/qtsubdir/sources/thirdparty/` and get its build files into `~/src/qtsubdir-build/sources/libraries/mylib/` and add it as a subproject to "thirdparty".
- Create a new "Other Project > Subdirs Project" called `plugins` in `~/src/qtsubdir/sources/` and add it as a subproject to "sources.pro"
- Create a new "Other Project > Subdirs Project" called `load` in `~/src/qtsubdir/sources/plugins` and add it as a subproject to "plugins.pro"
- Create a new "Libraries > C++ Library" called `loadTxt` as a "Shared Library" in `~/src/qtsubdir/sources/plugins/load` and add it as a subproject to "load.pro".




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


# Todo

- How to prepare a `make install`?


# Notes

The format of the .pri files is exactly the same as the format of the .pro files. The main difference is one of intent; a .pro is what most people would expect to run qmake on directly, while a .pri is to be included by a .pro. 



Better way for creating a .pri (to be tested):

    You can create a new .pri file with Qt Creator as follows:

    - Select File in the menu bar.
    - Select New File or Project....
    - Choose General under Files and Classes on the New dialog.
    - Give the name of your file with extension, for example: test.pri.
