import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    id: rectangle1
    width: Screen.width
    height: Screen.height
    //    height: 600
    //  anchors.centerIn: parent
    border.color: "#E3E3E3"
    border.width: 5
    color: "#E3E3E3"
    property alias listView1: listView1
    focus: true
    Image {
        id: image1
        width: 400
        height: 215
        anchors.horizontalCenterOffset: -760
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/rsrc/Rolisteam.svg"
    }

    Text {
        id: text1
        anchors.top:image1.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        width: 833
        height: 191
        color: "black"
        text: qsTr("Et le code, alors ?")
        anchors.horizontalCenterOffset: 1
        anchors.topMargin: -203
        font.family: "Verdana"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Screen.height/20
    }

    ListView {
        id: listView1
        x: Screen.width/4
        y: Screen.height/4
        width: Screen.width/2
        height: Screen.height/2
        delegate: Item {
            width: Screen.width/2
            height: listView1.height/listView1.count
                Text {
                    color: "black"
                    text: name
                    font.pointSize: Screen.height/28
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
        }
        model: ListModel {
            ListElement {
                name: "7 ans de développement (+ ou - réguliers)"
            }
            ListElement {
                name: "La compatibilité avec GNU/Linux"//système de build, code spécifique par OS.
            }
            ListElement {
                name: "Les problèmes de Fmod: Licence et 64bits"
            }
            ListElement {
                name: "Traduction du code source"
            }
        }
    }

    Keys.onDownPressed: {
            if(state == "")
            {
                state="simple"
            }
            else if(state=="simple")
            {
                state ="";
            }
        }
        Text {
            id: panelInfo
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            width: parent.width*0.8
            height: parent.height*0.3
            font.pointSize: Screen.height/50
            text: "«<i>Le jeu de rôle est un jeu de société dans lequel les participants <br/>conçoivent ensemble une fiction par l’interprétation de rôles et par la narration,<br/> dans le cadre de contraintes de jeu qu’ils s’imposent.</i>»<br/>   -Wikipedia"
            visible: false
        }
        states: [
            State {
                name: "simple"
                PropertyChanges {
                    target: panelInfo
                    visible: true
                }
            }
        ]
}
