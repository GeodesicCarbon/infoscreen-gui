import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: jdr
    width: app.width
    height: app.height
    border.color: app.bgColor
    border.width: 5
    color: app.bgColor
    property int idState: 0
    Text {
        id: text1
        anchors.top:parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: jdr.height*0.1
        color: app.txtColor
        text: qsTr("Stay in touch")
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.height/18
    }
    focus: true
    Keys.onUpPressed: {
        --idState;
    }
    Keys.onDownPressed: {
        ++idState
    }
    onIdStateChanged: {
        trigger.start()
    }

    Timer {
         id: trigger
         interval: 1001
         repeat: false
         onTriggered: app.currentItemChanged(view.currentItem)
     }
    ListView {
        id: listView1
        x: jdr.width*0.1
        y: jdr.height*0.20
        width: jdr.width
        height: parent.height*0.5
        delegate: Item {
            width: jdr.width/2
            height: listView1.height/listView1.count
                Text {
                    color: app.txtColor
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/28
                    anchors.verticalCenter: parent.verticalCenter
                }
                opacity: (jdr.idState >= index ) ? 1.0: 0.0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }

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

    Text {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: "PS: This slide presentation is in QML"
        font.pointSize: (app.height >100 ? app.height : 800)/48
    }

}
