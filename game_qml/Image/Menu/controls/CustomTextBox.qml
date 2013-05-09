// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "CustomButtonSettings.js" as Settings

Rectangle
{
    id: customTextBox

    color: "transparent"

    radius: 8

    border.color: Settings.defaultColor



//    BorderImage
//    {
//        id:borderImage

//        width: parent.width
//        height: parent.height

//        border { left: 5; top: 5; right: 6; bottom: 5 }
//        horizontalTileMode: BorderImage.Repeat
//        verticalTileMode: BorderImage.Repeat
//        source: "qrc:/res/BorderDefault.png"
//    }

    TextInput
    {
        id: textInput

        anchors.centerIn: parent

        font.capitalization: Font.AllUppercase

        color: Settings.defaultColor
        selectionColor: Settings.selectedColor
        font.pixelSize: customTextBox.height - 8
        width: parent.width - 8
        height: parent.height
        smooth: true
//        selectByMouse: false


        focus: true
    }

    Text {
           id: unfocusedText
           clip: true
           anchors.fill: textInput
           font: textInput.font
           opacity: textInput.text.length && !textInput.activeFocus ? 1 : 0
           color: textInput.color
           elide: Text.ElideRight
           text: textInput.text
//           text.length: (width / font.pixelSize + 2)
           smooth: true
       }
}
