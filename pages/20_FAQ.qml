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
    property alias listView1: listView1
    property int idState: 0

    focus: true

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
        text: qsTr("Merci de m'avoir écouter")
        anchors.horizontalCenterOffset: 1
        //anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: ScreenH/20
    }

    ListView {
        id: listView1
        x: ScreenW/4
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
        }
        model: ListModel {
            model: ListModel {
                ListElement {
                    name: "A vos questions!"
                    index:0
                }
                ListElement {
                    name: "Site web: <font color=\"blue\"><b>www.rolisteam.org</b></font>"
                    index:1
                }
                ListElement {
                    name: "Email: <font color=\"blue\"><b>renaud@rolisteam.org</b></font>"
                    index:1
                }
                ListElement {
                    name: "Twitter: <font color=\"blue\"><b>@Rolisteam</b></font>"
                    index:1
                }
                ListElement {
                    name: "Facebook: <font color=\"blue\"><b>www.facebook.com/rolisteam</b></font>"
                    index:1
                }
                ListElement {
                    name: "Irc: <font color=\"blue\"><b>#RolisteamOfficial</b></font> on freenode.net"
                    index:1
                }
                ListElement {
                    name: "Github: <font color=\"blue\"><b>github.com/Rolisteam</b></font>"
                    index:1
                }
            }
        }
    }

    Text {
        id: text2
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: ScreenW*0.4
        anchors.bottomMargin: 50
        color: app.txtColor
        text: qsTr("Merci à : Chewba, Hythlodée, Henriette")
    }
}
