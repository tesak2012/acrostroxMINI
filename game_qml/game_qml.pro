#-------------------------------------------------
#
# Project created by QtCreator 2013-05-04T13:27:12
#
#-------------------------------------------------

QT       += core gui\
core declarative

TARGET = game_qml
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    block.cpp \
    box.cpp

HEADERS  += mainwindow.h \
    block.h \
    box.h

OTHER_FILES += \
    main.qml

RESOURCES += \
    res.qrc
