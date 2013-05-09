// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "controls"

Rectangle
{
    property int animationTime: 500

    id: main_menu
    width: 350
    height: 350
    color: "black"

    Image
    {
        id: background

        anchors.fill: parent
       source: "qrc:/Image/bg.bmp"

        fillMode: Image.Stretch;
        smooth: true
    }

    CustomLabel
    {
        id: labelGameName1
        x: parent.width / 2 - width / 2
        y: parent.width / 4 - height / 2
        text: "ACROSTROX"
        fontPixelSize: 36
        border.width: 0
        opacity: 0
        colorText:"yellow"

    }

    CustomLabel
    {
        id: labelGameName2
        x: labelGameName1.x + labelGameName1.width - width
        y: labelGameName1.y + labelGameName1.height
        text: " MINI "
        fontPixelSize: labelGameName1.fontPixelSize / 3
        opacity: 0
        border.width: 2
    }


//    CustomTextBox
//    {
//        anchors.centerIn: parent
//        width: 200
//        height: 50

//        border.width: 3
//    }

    Column
    {
        id:mainMenu_column

        x: parent.width / 2 - width / 2
        y: (parent.height / 3) * 2 - height / 2

        spacing: 20

        move: Transition {
                 NumberAnimation {
                     properties: "y"
                     easing.type: Easing.OutBounce
                 }
             }

        add: Transition {
                 NumberAnimation {
                    properties: "opacity"
                     easing.type: Easing.OutBounce
                 }
             }

        CustomButton
        {
            id: playButton
            opacity: 0

////            x: 100
////            y: 200
            text: "PLAY"
            MouseArea
            {
                anchors.fill: parent
                onClicked: window.beginGame()

            }
////            Behavior on opacity { NumberAnimation {} }
        }

        CustomButton
        {
            id: settingsButton
           opacity: 0

            //x: 100
           // y: 200
            text: "SETTINGS"
            Behavior on opacity { NumberAnimation {} }
        }

        CustomButton
        {
            id: quitButton
            opacity: 0
            text: "QUIT"
            MouseArea
            {
                anchors.fill: parent
                onClicked: window.close()

            }

            Behavior on opacity { NumberAnimation {} }
       }
   }

    SequentialAnimation
    {
        loops: Animation.Infinite
        running: true
        NumberAnimation { target: labelGameName1; property: "opacity";from: 0; to: 1.0; duration: animationTime }
        NumberAnimation { target: labelGameName2; property: "opacity";from: 0; to: 1.0; duration: animationTime }

       NumberAnimation { target: mainMenu_column; property: "opacity";from: 0; to: 1.0; duration: animationTime }

        NumberAnimation { target: playButton; property: "opacity"; from: 0; to: 1.0; duration: animationTime }
        NumberAnimation { target: settingsButton; property: "opacity"; from: 0; to: 1.0; duration: animationTime }
        NumberAnimation { target: quitButton; property: "opacity"; from: 0; to: 1.0; duration: animationTime }
    }
}


