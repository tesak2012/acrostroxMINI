// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "qml/game_menu_qml/controls"

Rectangle {
    width: window.width
    height: window.height
     property int animationTime: 500

Image {
    anchors.fill: parent
    opacity: 1
    smooth: false
    fillMode: Image.Stretch
    source: "qrc:/Image/bg.bmp"

    CustomLabel
    {
        id: labelResult
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height/18
        text: "RESULT"
        fontPixelSize: parent.width/10
        border.width: 0
        opacity: 1
        colorText:"yellow"

    }

        CustomButton
        {
            id: okButton
            opacity: 0
            y: parent.height/7*6
            text: "OK"
            anchors.horizontalCenter: parent.horizontalCenter
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {// Открытие базы данных ExampleDB
                          var db = openDatabaseSync("Statistic","1.0","rating game",1000000);

                          db.transaction(
                                      function(tx)
                                      {
                                          // Создание таблицы Greeting, если она еще не существовала
                                          tx.executeSql('CREATE TABLE IF NOT EXISTS Results(Nickname TEXT, Time QREAL)');
                                          // Добавление новой строки в таблицу Greeting
                                          tx.executeSql('INSERT INTO Results VALUES(?, ?)',[qsTr(text_inputUserName.text),valueTime]);
                                      }
                                      )
                          window.returnMenu()
                }

            }
    }
        }

        Text {
            id: textTime
            anchors.horizontalCenter: parent.horizontalCenter
            color:"yellow"
            y: parent.height/7*2
            width: parent.width/5*3
            height: parent.height/18
            text: "Your results is:"+valueTime + " sec."
            font.pixelSize: parent.height/18
        }

        Text {
            id: textMessage
            y: parent.height/7*4
            anchors.horizontalCenter: parent.horizontalCenter
            color:"yellow"
            text: qsTr("Enter your name and press OK:")
            font.pixelSize: parent.height/18
        }
        TextInput {
                id: text_inputUserName
                y: parent.height/7*5
                anchors.horizontalCenter: parent.horizontalCenter
//                width: window.width/3
//                height: window.height/18
                color: "#ea2a0c"
                text: qsTr("Player1")
                font.pixelSize: parent.height/18

            }
        SequentialAnimation
        {
            loops: Animation.Infinite
            running: true
            NumberAnimation { target: okButton; property: "opacity"; from: 0; to: 1.0; duration: animationTime*3 }
        }
    }

