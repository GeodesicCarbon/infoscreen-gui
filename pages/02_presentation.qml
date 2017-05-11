import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: ScreenW
    height: ScreenH
    //    height: 600
    //  anchors.centerIn: parent
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor

    Image {
        id: image1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: ScreenW*0.04
        fillMode: Image.PreserveAspectFit
        source: "qrc:/rsrc/Rolisteam.svg"
        width: ScreenW*0.2
    }

    Text {
        id: text1
        anchors.top:image1.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: image1.bottom

        width: ScreenW*0.5
        height: ScreenH*0.05
        color: app.txtColor
        text: qsTr("Présentation Rolisteam")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }

    Image {
        id: screenShot
        source : "qrc:/rsrc/screen.png"
        anchors.top: text1.bottom
        anchors.right: parent.right
        //anchors.leftMargin: ScreenW*0.05

        fillMode: Image.PreserveAspectFit
        width: ScreenW*0.6
        height: ScreenH*0.6
        visible: true
    }

    ListView {
        id: listView1
        x: ScreenW*0.01
        y: ScreenH/4
        width: ScreenW/2
        height: ScreenH/2
        delegate: Item {
            width: ScreenW/2
            height: listView1.height/listView1.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: ScreenH/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                opacity: (listView1.currentIndex >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }
        focus: true
        Keys.onUpPressed: {
            decrementCurrentIndex()
        }
        Keys.onDownPressed: {
             incrementCurrentIndex()
        }
        onCurrentIndexChanged: {
            trigger.start()
        }

        model: ListModel {
            ListElement {
                name: "2009 - fork de rolistik"
                index:0
            }
            ListElement {
                name: "Dépannage"
                index:1
            }
        }
    }
}
