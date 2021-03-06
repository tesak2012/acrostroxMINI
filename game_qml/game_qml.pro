#-------------------------------------------------
#
# Project created by QtCreator 2013-05-04T13:27:12
#
#-------------------------------------------------

QT       += core gui\
          core  declarative

TARGET = game_qml
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
        box.cpp

HEADERS  += mainwindow.h \
        box.h

OTHER_FILES += \
    main.qml \
    qml/game_menu_qml/main.qml \
    qml/game_menu_qml/controls/CustomButtonSettings.js \
    qml/game_menu_qml/controls/CustomTextBox.qml \
    qml/game_menu_qml/controls/CustomLabel.qml \
    qml/game_menu_qml/controls/CustomButton.qml\
    qml/game_menu_qml/results.qml\
    result.qml \
    basa.qml


RESOURCES += \
    res.qrc
