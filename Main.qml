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

    Fundamentos { id: fundamentosModel }
    ControlDeFlujo { id: controlDeFlujoModel }
    EstructurasDeDatos { id: estructurasDeDatosModel }
    Funciones { id: funcionesModel }
    Poo { id: pooModel }
    HerenciaYPolimorfismo { id: herenciaYPolimorfismoModel }
    Friends { id: friendsModel }
    ConstYMiembrosEstaticos { id: constYMiembrosEstaticosModel }
    Namespaces { id: namespacesModel }
    ManejoMemoria { id: manejoMemoriaModel }
    OperadorSobrecarga { id: operadorSobrecargaModel }
    PlantillasYGenericas { id: plantillasYGenericasModel }
    Concepts { id: conceptsModel }
    Semantics { id: semanticsModel }
    FuncionesComoEntidades { id: funcionesComoEntidadesModel }
    Iteradores { id: iteradoresModel }
    StdAlgoritmos { id: stdAlgoritmosModel }
    Corutinas { id: corutinasModel }

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
        console.log("===============createFilesMap==================");
        for (var i = 0; i < fundamentosModel.fundamentosType.count; i++) {
            var item = fundamentosModel.fundamentosType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Fundamentos/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < controlDeFlujoModel.controlDeFlujoType.count; i++) {
            var item = controlDeFlujoModel.controlDeFlujoType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Control de flujo/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < estructurasDeDatosModel.estructurasDeDatosType.count; i++) {
            var item = estructurasDeDatosModel.estructurasDeDatosType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Estructuras de datos/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < funcionesModel.funcionesType.count; i++) {
            var item = funcionesModel.funcionesType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Funciones/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < pooModel.pooType.count; i++) {
            var item = pooModel.pooType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/POO/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < herenciaYPolimorfismoModel.herenciaYPolimorfismoType.count; i++) {
            var item = herenciaYPolimorfismoModel.herenciaYPolimorfismoType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Herencia y polimorfismo/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < friendsModel.friendsType.count; i++) {
            var item = friendsModel.friendsType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Friends/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < constYMiembrosEstaticosModel.constYMiembrosEstaticosType.count; i++) {
            var item = constYMiembrosEstaticosModel.constYMiembrosEstaticosType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Const y miembros estaticos/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < namespacesModel.namespacesType.count; i++) {
            var item = namespacesModel.namespacesType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/namespaces/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < manejoMemoriaModel.manejoMemoriaType.count; i++) {
            var item = manejoMemoriaModel.manejoMemoriaType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Manejo de memoria/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < operadorSobrecargaModel.operadorSobrecargaType.count; i++) {
            var item = operadorSobrecargaModel.operadorSobrecargaType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Operador sobrecarga/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < plantillasYGenericasModel.plantillasYGenericasType.count; i++) {
            var item = plantillasYGenericasModel.plantillasYGenericasType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Plantillas y genericas/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < conceptsModel.conceptsType.count; i++) {
            var item = conceptsModel.conceptsType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Concepts/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < semanticsModel.semanticsType.count; i++) {
            var item = semanticsModel.semanticsType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Semantics/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < funcionesComoEntidadesModel.funcionesComoEntidadesType.count; i++) {
            var item = funcionesComoEntidadesModel.funcionesComoEntidadesType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Funciones como entidades/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < iteradoresModel.iteradoresType.count; i++) {
            var item = iteradoresModel.iteradoresType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Iteradores/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < stdAlgoritmosModel.stdAlgoritmosType.count; i++) {
            var item = stdAlgoritmosModel.stdAlgoritmosType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/StdAlgoritmos/" + item.name + ".txt";
            topics.push(item.name);
        }
        for (var i = 0; i < corutinasModel.corutinasType.count; i++) {
            var item = corutinasModel.corutinasType.get(i);
            map[item.name] = ":/Assets/Code/CPlusPlus/Corutinas/" + item.name + ".txt";
            topics.push(item.name);
        }


        combinedTopics = topics;
        console.log("=================================");
        for (var key in map) {
            console.log("=================================");
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
