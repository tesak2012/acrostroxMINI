// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 480
    height: 250

    Rectangle {
        id: button_blue
        x: 181
        y: 136
        width: 119
        height: 51
        color: button_blue_mouse_area.pressed ? "darkblue" : "lightblue"
        radius: 7
        border.width: 3
        border.color: "darkblue"
        Text {
            id: button_blue_label
            x: 47
            y: 16
            text: qsTr("Exit")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
        }
        MouseArea {
            id: button_blue_mouse_area
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "black"
            onExited: parent.border.color = "darkblue"
            onClicked: rect_color_change.color = "lightblue"
        }
    }

    Rectangle {
        id: button_red
        x: 181
        y: 63
        width: 119
        height: 51
        color: "#ea5454"
        //color: "#f95a5a"
        radius: 7
        border.width: 3
        border.color: "darkred"

        Text {
            id: button_red_label
            x: 38
            y: 18
            text: qsTr("Game")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 16
        }
        MouseArea {
            id: button_red_mouse_area
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.border.color = "black"
            onExited: parent.border.color = "darkred"
            onClicked: rect_color_change.color = "red"
        }

    }

    Text {
        id: text1
        x: 31
        y: 165
        width: 46
        height: 25
        text: "Acrostrox"
        font.italic: false
        font.bold: true
        rotation: -50
        font.family: "Stencil"
        font.pixelSize: 25
    }

    Text {
        id: text2
        x: 351
        y: 81
        width: 86
        height: 37
        text: qsTr("MINI")
        transformOrigin: Item.Center
        rotation: 40
        font.family: "Snap ITC"
        font.pixelSize: 30
    }


    //    Rectangle {
    //        id: rect_color_change
    //        x: 186
    //        y: 30
    //        width: 167
    //        height: 148
    //        color: "#ffffff"
//        border.width: 3
//        border.color: "#000000"
//        MouseArea {
//            id: rect_color_change_mouse_area
//            anchors.fill: parent
//            onEntered: rect_color_change.color = "white"
//        }
//    }

}
