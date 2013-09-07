# Creating the project structure

- Create a new "Other Project > Subdirs Project" called `subdir` in `~/src/` and get its build files into `~/src/qtsubdir-build/sources/`. Don't add it to any existing subproject.
- Create a new "Other Project > Subdirs Project" called `sources` in `~/src/qtsubdir/` and add it as a subproject to "qtsubdir"
- Create a new "Other Project > Subdirs Project" called `thirdparty` in `~/src/qtsubdir/sources` and add it as a subproject to "sources"
- Create a new "Libraries > C++ Library" as a "Shared Library" called `awesomelib` in `~/src/qtsubdir/sources/thirdparty/` and get its build files into `~/src/qtsubdir-build/sources/libraries/mylib/` and add it as a subproject to "thirdparty".
- Create a new "Other Project > Subdirs Project" called `libraries` in `~/src/qtsubdir/sources/` and add it as a subproject to "qtsubdir.pro.
- Create a new "Libraries > C++ Library" as a "Shared Library" called `mylib` in `~/src/qtsubdir/sources/library/` and add it as a subproject to "sources.pro.
- Create a new "Other Project > Subdirs Project" called `plugins` in `~/src/qtsubdir/sources/` and add it as a subproject to "sources.pro"
- Create a new "Other Project > Subdirs Project" called `load` in `~/src/qtsubdir/sources/plugins` and add it as a subproject to "plugins.pro"
- Create a new "Libraries > C++ Library" called `loadTxt` as a "Shared Library" in `~/src/qtsubdir/sources/plugins/load`and add it as a subproject to "load.pro".

Now your project should look like this one:

![Project structure in Qt Creator](https://raw.github.com/aoloe/qtsubdir/project_creation/documentation/images/qtsubdir_project.png)

You should now be able to build the "subdir" project. This will create a directory `~/src/qtsubdir-build` (you defined that target directory in the first step above) with the following content:

    qtsubdir-build/
        Makefile
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
