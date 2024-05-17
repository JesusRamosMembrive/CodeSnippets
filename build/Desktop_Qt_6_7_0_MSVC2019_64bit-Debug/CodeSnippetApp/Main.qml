import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

import "./Modules/ListsOfModels"
import "./Modules/Utils"

Window {
    id: appWindow
    width: 1200
    height: 900
    visible: true
    color: "#e6000000"
    title: qsTr("Code Snippets")
    Material.theme: Material.Dark
    Material.accent: Material.Orange

    flags: Qt.FramelessWindowHint | Qt.WA_TranslucentBackground
    DragHandler {
        onActiveChanged: if(active) startSystemMove();
    }

    CustomMouseAreaResize {
        id: mouseAreaResize
    }

    ControlFlowModels {id: controlFlowModel}
    DataTypesModel {id: dataTypesModel}
    FileReader {id: fileReader}

    property var filesMap: createFilesMap()

    function createFilesMap() {
        console.log("===========CREANDO EL MAPA===============")
        var map = {};
        for (var i = 0; i < dataTypesModel.dataTypes.count; i++) {
            var item = dataTypesModel.dataTypes.get(i);
            map[item.name] = ":/Code/Assets/Code/CPlusPlus/" + item.name + ".txt";
        }

        for (var j = 0; j < controlFlowModel.controlFlowTypes.count; j++) {
            var item = controlFlowModel.controlFlowTypes.get(j);
            map[item.name] = ":/Code/Assets/Code/CPlusPlus/" + item.name + ".txt";
        }

        for (var key in map) {
            console.log(key, map[key]);
        }
        return map;
    }

    function loadFile(fileName) {
        var file = filesMap[fileName];
        console.log("Loading file", file);
        return file;
    }

    function loadFileContent(fileName) {
        // Asegúrate de que fileName esté correcto
        var filePath = loadFile(fileName);
        console.log("Loading content for", filePath);
        fileProcessor.processFile(filePath);  // Llamada al método processFile de fileProcessor
    }

    function updateFileList(files) {
        fileListModel.clear();
        for (var i = 0; i < files.length; i++) {
            fileListModel.append({name: files[i]});
        }
    }

    DialogExit {
        id: messageDialog
    }

    Component.onCompleted: {
        filesMap = createFilesMap();  // Reconstruir el mapa cuando se inicia la aplicación
    }
    ColumnLayout {
        id: mainLayout
        anchors.fill: parent
        anchors.centerIn: parent

        RowLayout {
            id: titleBarRow
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredHeight: 45
            MyTitleBar {
                id: titleBar
            }
        }

        // Menu Bar
        MyMenuBar {
            id: menuBar
        }

        Row{
            id: mainContentRow
            Layout.fillHeight: true
            Layout.fillWidth: true
            height: parent.height
            spacing: 30

            Column{
                id: leftMainContent
                width: 240
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 15

                MyGroupbox {
                    id: groupboxTopics
                    width: parent.width
                    height: parent.height *0.89
                    anchors.top: parent.top
                    anchors.topMargin: 10

                    label: Label {
                        color: "#ffffff"
                        text: "Topics"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignTop
                        font.family: "Roboto Mono"
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 16
                        font.bold: true
                    }
                    ScrollViewTopics {
                        id: scrollViewTopics
                        anchors.fill: groupboxTopics
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        anchors.topMargin: 35
                        anchors.bottomMargin: 0
                    }
                }
                Button {
                    id: buttonExplanation
                    x: 48
                    width: 163
                    height: 67
                    text: qsTr("Explanation")
                    anchors.top: groupboxTopics.bottom
                    anchors.topMargin: 10
                    highlighted: false
                    flat: false
                    antialiasing: true

                    // onClicked: {
                    //     loadFileContent("IntegerModifiers");
                    // }
                }
            }

            Rectangle
            {
                id:backGroundStackView
                height: mainLayout.height *0.87
                color: "#00ffffff"
                radius:15
                anchors.left: leftMainContent.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 10
                StackView {
                    id: stackView
                    anchors.fill: parent
                    anchors.centerIn: parent
                    initialItem: "CodeDisplayPage.qml"
                    width: 950
                    height: 750

                }
            }
        }
    }


}

