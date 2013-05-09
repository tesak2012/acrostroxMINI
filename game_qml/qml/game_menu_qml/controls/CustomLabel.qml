// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "CustomButtonSettings.js" as Settings

Rectangle
{
    id: customLabel

    property alias text: buttonText.text
    property alias fontPixelSize: buttonText.font.pixelSize
        property alias colorText: buttonText.color
    property int glowTime: 500

    width: buttonText.width
    height: buttonText.height

    radius: 4
    color: "transparent"
    border.color: Settings.defaultColor
    smooth: true

    FontLoader
    {
        id: fontLoader
        source: "qrc:/res/Image/fonts/slkscre.ttf"
    }

    Text
    {
        id: buttonText
//        anchors.centerIn: parent
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
//        font.pixelSize: parent.height - 6
        font.family: fontLoader.name
        color: Settings.defaultColor
//        ColorAnimation on color { to: Settings.defaultColor; duration: 500 }
    }

}
