// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "CustomButtonSettings.js" as Settings

Rectangle {
    id: customButton


    property alias text: buttonText.text

    width: window.width/2
    height: window.height/14

    radius: 8

//    anchors.fill: selectedBackgroundImage
    clip: true
    color: "transparent"
    opacity: 1

    Image
    {
        id: selectedBackgroundImage

        width: parent.width
        height: parent.height

        source: "qrc:/res/Image/background_select_fill_sample.png"
        visible: false
        opacity: 0.6
        smooth: true
        fillMode: Image.Tile
    }

    BorderImage
    {
        id:borderImage

        width: parent.width
        height: parent.height

        border { left: 5; top: 5; right: 6; bottom: 5 }
        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat
        source: "qrc:/res/Image/BorderDefault.png"
    }

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        enabled: true

        onEntered: { borderImage.source = "qrc:/res/Image/BorderSelected.png"; buttonText.color = Settings.selectedColor; selectedBackgroundImage.visible = true}//filter_rectangle.state = "Hovered"
        onExited: { borderImage.source = "qrc:/res/Image/BorderDefault.png"; buttonText.color = Settings.defaultColor; selectedBackgroundImage.visible = false }//customButton.state = "Default"
        onPressed: { customButton.y = customButton.y + 2 }//customButton.state = "Pressed"
        onReleased: { customButton.y = customButton.y - 2 }//customButton.state = "Released"
    }

    FontLoader
    {
        id: fontLoader
        source: "qrc:/fonts/slkscre.ttf"
    }

    Text
    {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: parent.height - 6
        font.family: fontLoader.name
        color: Settings.defaultColor
    }

    states:
    [
        State
        {
            name: "Clicked"; when: mouseArea.pressed && mouseArea.containsMouse
//                PropertyChanges { target: gr1; color:color3 }
        },

        State
        {
            name: "Hovered";
            PropertyChanges
            {
                target: filter_rectangle;
                color: Settings.selectedColor
            }
        },

        State
        {
            name: "Default";
            PropertyChanges
            {
                target: filter_rectangle;
                color: Settings.defaultColor
            }
        },

        State
        {
            name: "Pressed";
//            when: mouseArea.pressed && mouseArea.containsMouse
            PropertyChanges
            {
                target: filter_rectangle;
                width: 50
//                y: filter_rectangle.y - 2
            }
        },

        State
        {
            name: "Released";
            PropertyChanges
            {
                target: filter_rectangle;
//                width: 150
//                y: filter_rectangle.y + 2
            }
            PropertyChanges
            {
                target: filter_rectangle;
                color: Settings.defaultColor
            }
        }
    ]
}
