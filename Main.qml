import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs
import QtQuick.Controls.Windows

import "./Modules/ListsOfModels"
import "./Modules/Utils"
import "./Modules/Style"

Window {
    id: appWindow
    width: 1200
    height: 900
    visible: true
    color: "#000000"
    flags: Qt.Window
    title: qsTr("Code Snippets")
    Material.theme: Material.Dark
    Material.accent: Material.Orange

    DragHandler {
        onActiveChanged: if (active) startSystemMove();
    }

    CustomMouseAreaResize {
        id: mouseAreaResize
    }

    ControlFlowModels { id: controlFlowModel }
    DataTypesModel { id: dataTypesModel }
    Bitwise { id: bitWiseType }
    LiteralConstants { id: literalConstants }
    Loops { id: loops }
    OverFlow { id: overflow }
    FileReader { id: fileReader }

    property var filesMap: createFilesMap()
    property var combinedTopics: []
    property string explanationText: ""
    property string currentTopic: ""
    property Theme theme: Theme {}

    ListModel {
        id: filteredTopicsModel
    }

    function createFilesMap() {
        var map = {};
        var topics = [];
        for (var i = 0; i < dataTypesModel.dataTypes.count; i++) {
            var item = dataTypesModel.dataTypes.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Fundamentos/" + item.name + ".txt";
            topics.push(item.name);
        }

        for (var j = 0; j < controlFlowModel.controlFlowTypes.count; j++) {
            var item = controlFlowModel.controlFlowTypes.get(j);
            map[item.name] = ":/POO/Assets/Code/CPlusPlus/POO/" + item.name + ".txt";
            topics.push(item.name);
        }

        for (var j = 0; j < bitWiseType.bitWiseModel.count; j++) {
            var item = bitWiseType.bitWiseModel.get(j);
            map[item.name] = ":/Code/Assets/Code/CPlusPlus/Bitwise-" + item.name + ".txt";
            topics.push(item.name);
        }

        for (var j = 0; j < literalConstants.literalConstantsType.count; j++) {
            var item = literalConstants.literalConstantsType.get(j);
            map[item.name] = ":/Code/Assets/Code/CPlusPlus/LiteralAndConst-" + item.name + ".txt";
            topics.push(item.name);
        }

        for (var j = 0; j < loops.loopsTypeModel.count; j++) {
            var item = loops.loopsTypeModel.get(j);
            map[item.name] = ":/Code/Assets/Code/CPlusPlus/Loops-" + item.name + ".txt";
            topics.push(item.name);
        }

        for (var j = 0; j < overflow.overFlowTypes.count; j++) {
            var item = overflow.overFlowTypes.get(j);
            map[item.name] = ":/Code/Assets/Code/CPlusPlus/OverflowAndUnderflow-" + item.name + ".txt";
            topics.push(item.name);
        }

        combinedTopics = topics;
        for (var key in map) {
            console.log(key, map[key]);
        }
        return map;
    }

    function loadFile(fileName) {
        var file = filesMap[fileName];
        currentTopic = fileName;
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

    function filterTopics(searchText) {
        filteredTopicsModel.clear();
        for (var i = 0; i < combinedTopics.length; i++) {
            var topic = combinedTopics[i];
            if (topic.toLowerCase().indexOf(searchText.toLowerCase()) !== -1) {
                filteredTopicsModel.append({"name": topic});
            }
        }
    }

    DialogExit {
        id: messageDialog
    }

    Component.onCompleted: {
        filesMap = createFilesMap();  // Reconstruir el mapa cuando se inicia la aplicación
        filterTopics(""); // Inicializar el modelo filtrado con todos los temas
    }

    Column {
        id: mainLayout
        // anchors.fill: parent
        // anchors.centerIn: parent
        height: parent.height
        padding: 0
        spacing: 15
        width: parent.width

        // RowLayout {
        //     id: titleBarRow
        //     Layout.fillHeight: true
        //     Layout.fillWidth: true
        //     Layout.preferredHeight: 45
        //     MyTitleBar {
        //         id: titleBar
        //     }
        // }

        // Menu Bar
        MyMenuBar {
            id: menuBar
            width: parent.width
        }

        Row {
            id: mainContentRow
            Layout.fillHeight: true
            Layout.fillWidth: true
            height: parent.height
            width: parent.width
            padding: 15
            spacing: 30

            Column {
                id: leftMainContent
                width: 230
                height: parent.height *0.92
                padding: 0

                // anchors.left: parent.left
                // anchors.leftMargin: 15

                MyGroupbox {
                    id: groupboxTopics
                    height: parent.height * 0.92
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.topMargin: 0

                    ScrollViewTopics {
                        id: scrollViewTopics
                        height: groupboxTopics.height
                        width: groupboxTopics.width
                        // anchors.fill: groupboxTopics

                    }
                }

                Button {
                    id: buttonExplanation
                    width: 150
                    height: 55
                    text: qsTr("Code")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: groupboxTopics.bottom
                    anchors.topMargin: 10
                    highlighted: false
                    flat: false
                    antialiasing: true
                    onClicked: {
                        if (stackView.depth === 1) {
                            stackView.push("CodeDisplayPage.qml")
                            buttonExplanation.text = qsTr("Explanation")
                        } else {
                            stackView.pop()
                            buttonExplanation.text = qsTr("Code")
                        }
                    }
                }
            }

            Rectangle {
                id: backGroundStackView
                height: mainLayout.height * 0.92
                color: theme.backGroundStackViewColor
                radius: 15
                anchors.left: leftMainContent.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.rightMargin: 10
                anchors.topMargin: 0
                StackView {
                    id: stackView
                    // anchors.fill: parent
                    // anchors.centerIn: parent
                    initialItem: "ExplanationPage.qml"
                    width: parent.width
                    height: parent.height

                    pushEnter: Transition {
                        PropertyAnimation { property: "x"; from: stackView.height; to: 0; duration: 400; easing.type: Easing.InOutQuad }
                        PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.InOutQuad }
                    }

                }
            }
        }
    }

    Connections {
        target: fileProcessor
        function onExplanationChanged() {
            explanationText = fileProcessor.explanation;
        }
    }
}
