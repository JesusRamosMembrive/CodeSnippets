import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

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

    Fundamentos { id: fundamentosModel }
    ControlDeFlujo { id: controlDeFlujoModel }
    EstructurasDeDatos { id: estructurasDeDatosModel }
    Funciones { id: funcionesModel }
    Poo { id: pooModel }
    HerenciaYPolimorfismo { id: herenciaYPolimorfismoModel }
    Amigas { id: amigasModel }
    MiemborsStaticYConst { id: constYMiembrosEstaticosModel }
    Namespace { id: namespacesModel }
    GestionDeLaMemoria { id: manejoMemoriaModel }
    SobrecargaDeOperadores { id: operadorSobrecargaModel }
    Plantillas { id: plantillasYGenericasModel }
    Concepts { id: conceptsModel }
    Semantics { id: semanticsModel }
    FuncionesComoEntidades { id: funcionesComoEntidadesModel }
    Iteradores { id: iteradoresModel }
    StdAlgorithms { id: stdAlgoritmosModel }

    ListModel {id: filteredTopicsModel}
    FileReader { id: fileReader }

    property var filesMap: createFilesMap()
    property var combinedTopics: []
    property string explanationText: ""
    property string currentTopic: ""
    property Theme theme: Theme {}
    property var topicModels: []


    function createFilesMap() {
        var map = {};
        var topics = [];
        topicModels = [
            { model: fundamentosModel.fundamentosType, path: ":/Assets/Code/CPlusPlus/Fundamentos/", label: "Fundamentos" },
            { model: controlDeFlujoModel.controlDeFlujoType, path: ":/Assets/Code/CPlusPlus/Control de flujo/", label: "Control de flujo" },
            { model: estructurasDeDatosModel.estructurasDeDatosType, path: ":/Assets/Code/CPlusPlus/Estructuras de datos/", label: "Estructura de datos" },
            { model: funcionesModel.funcionesType, path: ":/Assets/Code/CPlusPlus/Funciones/", label: "Funciones" },
            { model: pooModel.pooType, path: ":/Assets/Code/CPlusPlus/POO/", label: "Clases" },
            { model: herenciaYPolimorfismoModel.herenciaYPolimorfismoType, path: ":/Assets/Code/CPlusPlus/Herencia y polimorfismo/", label: "Herencia y polimorfismo" },
            { model: amigasModel.amigasType, path: ":/Assets/Code/CPlusPlus/Friends/", label: "Friends" },
            { model: constYMiembrosEstaticosModel.miemborsStaticYConstType, path: ":/Assets/Code/CPlusPlus/Const y miembros estaticos/", label: "Const&Static members" },
            { model: namespacesModel.namespaceType, path: ":/Assets/Code/CPlusPlus/namespaces/", label: "Namespace" },
            { model: manejoMemoriaModel.gestionDeLaMemoriaType, path: ":/Assets/Code/CPlusPlus/Manejo memoria/", label: "Gestion de Memoria" },
            { model: operadorSobrecargaModel.sobrecargaDeOperadoresType, path: ":/Assets/Code/CPlusPlus/Operador sobrecarga/", label: "Sobrecarga de operadores" },
            { model: plantillasYGenericasModel.plantillasType, path: ":/Assets/Code/CPlusPlus/Plantillas y genericas/", label: "Plantillas" },
            { model: conceptsModel.conceptsType, path: ":/Assets/Code/CPlusPlus/Concepts/", label: "Concepts" },
            { model: semanticsModel.semanticsType, path: ":/Assets/Code/CPlusPlus/Semantics/", label: "Semantics" },
            { model: funcionesComoEntidadesModel.funcionesComoEntidadesType, path: ":/Assets/Code/CPlusPlus/Funciones como entidades/", label: "Funciones como entidades" },
            { model: iteradoresModel.iteradoresType, path: ":/Assets/Code/CPlusPlus/Iteradores/", label: "Iteradores" },
            { model: stdAlgoritmosModel.stdAlgorithmsType, path: ":/Assets/Code/CPlusPlus/Std Algoritmos/", label: "std::algorithms" }
        ];

        for (var j = 0; j < topicModels.length; j++) {
            var topicModel = topicModels[j];
            for (var i = 0; i < topicModel.model.count; i++) {
                var item = topicModel.model.get(i);
                map[item.name] = topicModel.path + item.name + ".txt";
                topics.push({ name: item.name, label: topicModel.label, model: topicModel.model });
            }
        }
        combinedTopics = topics;
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
        height: parent.height
        padding: 0
        spacing: 15
        width: parent.width

        // Menu Bar
        MyMenuBar {
            id: menuBar
            width: parent.width
        }

        Row {
            id: mainContentRow
            Layout.fillHeight: true
            Layout.fillWidth: true
            height: parent.height - menuBar.height - mainLayout.spacing
            width: parent.width
            padding: 15
            spacing: 30

            Column {
                id: leftMainContent
                width: 250
                height: parent.height *0.92
                padding: 0

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
                        anchors.horizontalCenter: parent.horizontalCenter
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
                    anchors.topMargin: 20
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
