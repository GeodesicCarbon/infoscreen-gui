import QtQuick 2.5

import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: app
    visibility: Window.FullScreen;
   // width: app.width
   // height: app.height
    visible: true
    title: qsTr("Infoscreen")

    property color bgColor: "transparent"
    property color txtColor: "transparent"
    readonly property int bgcount : 4

    function tcp_change(pZoom,pArea,pPage) {
//        view.currentIndex=pArea;
        // view.incrementCurrentIndex()
        switch (pArea) {
        case 4: bgimg.source = "qrc:/rsrc/Vakioruutu.jpg";
                break;
        case 3: bgimg.source = "qrc:/rsrc/Stepperit_servot.jpg";
                break;
        case 2: bgimg.source = "qrc:/rsrc/3d-printtaus.jpg";
                break;
        case 1: bgimg.source = "qrc:/rsrc/Skannerit 1.jpg";
            break;
        case 0: bgimg.source = "qrc:/rsrc/Hubble.jpg";
            bgimg.scale = (200 - pZoom)/100;
        }
    }
    signal currentItemChanged(int current)
    property alias current: view.currentIndex
//    onCurrentChanged: {
//        //topcornerimage.visible = falscreen_anglese
//        //bottomcornerimage.visible = false
//        if(current==0)
//            bgimg.source = "qrc:/rsrc/Vakioruutu.jpg"
//        else if(current % bgcount == 0)
//        {
//            bgimg.source = "qrc:/rsrc/Skannerit 1.jpg"
//        }
//        else if(current % bgcount == 1)
//        {
//            bgimg.source = "qrc:/rsrc/Skannerit 2.jpg";
//        }
//        else if(current % bgcount == 2)
//        {
//            bgimg.source = "qrc:/rsrc/Stepperit_servot.jpg";
//           // topcornerimage.visible = true
//        }
//        else if(current % bgmyQmlFunctioncount == 3)
//        {
//            bgimg.source = "qrc:/rsrc/3d-printtaus.jpg";
//           // topcornerimage.visible = true
//        }
/*

        else if(current % 9 == 4)screen_angle
        {
            bgimg.source = "qrc:/rsrc/dragon.jpg";
           // topcornerimage.visible = true
        }
        else if(current % 9 == 5)
        {
            bgto listviewimg.source = "qrc:/rsrc/cloud.jpg";
           // topcornerimage.visible = true
        }
        else if(current % 9 == 7)
        {
            bgimg.source = "qrc:/rsrc/square.jpg";
           // topcornerimage.visible = true
        }
        else if(current % 9 == 8)
        {
            bgimg.source = "qrc:/rsrc/nyc.jpg";
           // topcornerimage.visible =screen_angle true
        }*/
   // }

    ListModel {
            id: qtConModel
            ListElement {
                name: "Intro"
                path: "01_qtCon_intro.qml"
                time: 1
                next: "rcse"
            }
            ListElement {
                name: "Rolisteam CharacterSheet Editor"
                path: "02_qtCon_rcse.qml"
                time: 1
                next: "stay in touch"
            }
            ListElement {
                name: "Stay In Touch"
                path: "03_qtCon_stayintouch.qml"
                time: 1
                next: ""
            }
    }
    ListModel {
            id: panelModel
            ListElement {
                name: "Intro"
                path: "01_intro.qml"
                time: 1
                next: "Présentation de Rolisteam"
            }
            ListElement {
                name: "Présentation de Rolisteam"
                path: "02_presentation.qml"
                time: 1
                next: "définition Jdr"
            }
            ListElement {
                name: "Introduction au jdr"
                path: "03_jdr_et_rolisteam.qml"
                time: 1
                next: "Les contraintt childes"
            }
            ListElement {
                name: "Contraintes"
                path: "04_jdr_avantages_pb.qml"
                time: 1
                next: "Avantages de l'informatique"
            }

            ListElement {
                name: "Le jdr virtuel le plus"
                path: "05_avantage_jdr_virtuel.qml"
                time: 1
                next: "Fonctionnalités"
            }
            ListElement {
                name: "Fonctionnalités Rolisteam"
                path: "06_fonctionnalites_rolisteam.qml"
                time: 1
                next: "Système de dés"
            }
            ListElement {
                name: "Dice Parser"
                path: "13_dice_parser.qml"
                time: 1
                next: "RCSE"
            }
            ListElement {
                name: "RCSE"
                path: "14_rcse.qml"
                time: 1
                next: "Son usage"
            }
            /*ListElement {
                name: "Les Nouveautés 1.9"
                path: "15_nouveaute_1_8.qml"
                time: 1
                next: "À vto listviewenir"
            }*/
            /*ListElement {
                name: "Début de rolisteam"
                pathQListBox *list = Q_CHILD( parent, QListBox, "list" );: "07_rolisteam_debut.qml"
                time: 1
                next: "rolistik à rolisteam"
            }*/
           /* ListElement {
                name: "Rolistik à Rolisteam"
                path: "08_Rolistik_a_Rolisteam.qml"
                time: 1
                next: "Frise"
            }*/
            /*ListElement {
                name: "La frise"
                path: "10_frise_chronologique.qml"
                time: 1
                next: "Usage"
            }*/
            ListElement {
                name: "Son usage"
                path: "11_son_usage.qml"
                time: 1
                next: "Fonctionnement"
            }
            ListElement {
                name: "Son fonctionnement"
                path: "12_son_fonctionnement.qml"
                time: 1
                next: "L'avenir"
            }
            ListElement {
                name: "Projets d'avenir"
                path: "16_projet_avenir.qml"
                time: 1
                next: "Réussites"
            }
            ListElement {
                name: "Réussites"
                path: "17_reussites.qml"
                time: 1
                next: "Leçons"
            }
            ListElement {
                name: "Les leçons"
                path: "18_les_lecons.qml"
                time: 1
                next: "Libre et Rolisteam"
            }
            ListElement {
                name: "Objectif Rolisteam Libre"
                path: "19_objectif_rolisteam_libre.qml"
                time: 1
                next: "Need You"
            }
            ListElement {
                name: "Rolisteam a besoin de vous "
                path: "19_grafilabor.qml"
                time: 1
                next: "Fin FAQ"
            }
            ListElement {
                name: "Fin "
                path: "20_FAQ.qml"
                time: 1
                next: ""
            }
            /*ListElement {
                name: "Contact"
                path: "03_qtCon_stayintouch.qml"
                time: 1
                next: ""
            }*/
        }
    //Component.onCompleted: app.currentItemChanged(0)
   /* onVisibleChanged: trigger.start()
    Rectangle {
        id: rect
        anchors.fill: parent
        color: app.bgColor
    }*/
    Image {
        id: bgimg
        anchors.fill: parent
        // fillMode: Image.Center
        source: "qrc:/rsrc/Vakioruutu.jpg"
        verticalAlignment: Image.AlignBottom
    }

    onVisibleChanged: trigger.start()

    PathView {
        id: view
        anchors.fill: parent
        model: panelModel
        highlightRangeMode:PathView.StrictlyEnforceRange
        snapMode: PathView.SnapOneItem
        delegate:  Loader {
            //property variant model: model
             source: "pages/"+path
             width: app.width
             height: app.height
        }

        onOffsetChanged: {
            if(Math.floor(offset)===offset)
            {
                //app.currentItemChanged(offset)
                trigger.start()
            }
        }
        focus: true

        Keys.onLeftPressed: {
            decrementCurrentIndex()
        }
        Keys.onRightPressed:{
            incrementCurrentIndex()
        }
        Keys.onEscapePressed: {
            if(app.visibility === Window.FullScreen)
            {
                app.visibility = Window.Windowed;
            }
            else
            {
                app.visibility = Window.FullScreen;
            }
        }

        path: Path {
            startX: view.width/2
            startY: view.height/2
            PathLine { x: view.width/2+view.width*panelModel.count; y: view.height/2 }
        }
    }

    ListView {
        id: listView1
        x: app.width*0.02
        y: app.height*0.3
        width: parent.width/2
        height: app.height*0.2
        delegate: Item {
            width: parent.width
            height: listView1.height/listView1.count
                Text {
                    color: view.currentIndex>=index ? "black" : "gray"
                    text: name
                    font.pointSize: (app.height >100 ? app.height : 800)/48
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true

                }
        }
        visible: false //view.currentIndex>0 ? true : false

        model: ListModel {
            ListElement {
                name: "Overview"
                index:1
            }
            ListElement {
                name: "Scanner_1"
                index:2
            }
            ListElement {
                name: "Stepper"
                index:3
            }
            ListElement {
                name: "3dprint"
                index:4
            }
        }
    }
    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottomMargin: 50
        color: app.txtColor
        text: (view.currentIndex+1)+"/"+view.count
        visible: false
//        visible: view.currentIndex>0 ? true : false
    }

    Image {
        anchors.fill: parent
        source: "qrc:/rsrc/Masque-Video.png"
        //opacity: 0.5
        fillMode: Image.Pad
        visible: false
    }
    Text {
        anchors.top: parent.top
        color: app.txtColor
        anchors.right: parent.right
        text: panelModel.get(view.currentIndex).next+">"
        visible: false
            //        visible: panelModel.get(view.currentIndex).next !== "" ? true : false
    }
}
