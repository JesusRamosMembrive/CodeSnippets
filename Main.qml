import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Effects

import "./Modules/ListsOfModels"
import "./Modules/Utils"
import "./Modules/Style"


Window {
    id: appWindow
    width: 1200
    height: 900
    opacity: 1
    minimumWidth: 1000  // Ancho mínimo de la ventana
    minimumHeight: 800
    visible: true
    color: "#ef000000"
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

    ListModel { id: filteredTopicsModel }
    FileReader { id: fileReader }

    property var filesMap: ({})
    property var combinedTopics: []
    property string preExplanationText: ""
    property string explanationText: ""
    property string currentTopic: ""
    property Theme theme: Theme {}
    property var topicModels: []


    function createFilesMap() {
        var map = {};
        var topics = [];
        topicModels = [
                    { model: fundamentosModel.fundamentosType, path: ":/Assets/Code/CPlusPlus/Fundamentos/", label: "Fundamentos" },
                    { model: controlDeFlujoModel.controlDeFlujoType, path: ":/Assets/Code/CPlusPlus/Control de Flujo/", label: "Control de flujo" },
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
            fileListModel.append({ name: files[i] });
        }
    }

    function filterTopics(searchText) {
        filteredTopicsModel.clear();
        for (var i = 0; i < combinedTopics.length; i++) {
            var topic = combinedTopics[i];
            if (topic.name.toLowerCase().indexOf(searchText.toLowerCase()) !== -1) {
                filteredTopicsModel.append({ "name": topic.name });
            }
        }
    }

    Component.onCompleted: {
        filesMap = createFilesMap();  // Reconstruir el mapa cuando se inicia la aplicación
        filterTopics(""); // Inicializar el modelo filtrado con todos los temas
    }

    Column {
        id: mainLayout
        width: parent.width
        height: parent.height

        // Menu Bar
        MyMenuBar {
            id: menuBar
            width: parent.width
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        }

        Column {
            id: columnContent
            height: parent.height - menuBar.height
            padding: 15
            width: parent.width
            Layout.fillHeight: true
            Layout.fillWidth: true

            StackView {
                id: stackViewInitialPage
                initialItem: "InitialPage.qml"
                width: columnContent.width *0.97
                height: columnContent.height *0.9
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.fillHeight: true
                Layout.fillWidth: true

                pushEnter: Transition {
                    PropertyAnimation { property: "x"; from: stackViewInitialPage.height; to: 0; duration: 400; easing.type: Easing.InOutQuad }
                    PropertyAnimation { property: "opacity"; from: 0; to: 1; duration: 400; easing.type: Easing.InOutQuad }
                }
            }

            CustomRegularButton {
                id: switchToMainPageButton
                anchors.horizontalCenter: parent.horizontalCenter
                height: 75
                visible: true
                width: 180
                text: qsTr("Go to Main Page")
                onClicked: {
                    if (stackViewInitialPage.depth > 1) {
                        stackViewInitialPage.pop()
                        switchToMainPageButton.visible = false
                        var result = fileLister.listFoldersAndFiles("/home/jesusramos/Git/CodeSnippets/Assets/Code/CPlusPlus")
                        var arrayLength = result.length;
                        for (var i = 0; i < arrayLength; i++) {
                            console.log(result[i].name);
                        }
                    }
                }
            }
        }
    }

    Connections {
        target: communicationObject
        function onShowMainPage() {
            stackViewInitialPage.push("MainPage.qml")
            switchToMainPageButton.visible = true

        }
        function onShowExplanationPage() {
            if (stackViewInitialPage.depth > 1) {
                stackViewInitialPage.pop()
            }
        }
    }

    Connections {
        target: fileProcessor
        function onExplanationChanged() {
            preExplanationText = fileProcessor.explanation;
            explanationText = markdownProcessor.processMarkdown(preExplanationText);
        }
    }

    QtObject {
        id: communicationObject

        signal showMainPage
        signal showExplanationPage
    }
}
