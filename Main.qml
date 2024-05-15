import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "./Modules/ListsOfModels"
import "./Modules/Utils"

Window {
    width: 1200
    height: 800
    visible: true
    color: "#1e1d1d"
    title: qsTr("Code Snippets")
    Material.theme: Material.Dark

    ControlFlowModels {id: controlFlowModel}
    DataTypesModel {id: dataTypesModel}
    FileReader {id: fileReader}

    property var filesMap: createFilesMap()

    function createFilesMap() {
        console.log("===========CREANDO EL MAPA===============")
        var map = {};
        for (var i = 0; i < dataTypesModel.dataTypes.count; i++) {
            var item = dataTypesModel.dataTypes.get(i);
            map[item.name] = "qrc:/Code/Assets/Code/CPlusPlus/VariblesAndDataTypes/" + item.name + ".txt";
        }

        for (var j = 0; j < controlFlowModel.controlFlowTypes.count; j++) {
            var item = controlFlowModel.controlFlowTypes.get(j);
            map[item.name] = "qrc:/Code/Assets/Code/CPlusPlus/VariblesAndDataTypes/" + item.name + ".txt";
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

    // Ejemplo de un modelo con una lista de nombres de archivos
    ListModel {
        id: fileListModel
        ListElement { name: "main.cpp" }
        ListElement { name: "circle.h" }
        ListElement { name: "circle.cpp" }
    }

    // Función ficticia para cargar el contenido del archivo
    function loadFileContent(fileName) {
        // Aquí puedes implementar la lógica para cargar y mostrar el contenido del archivo
        console.log("Loading content for", fileName)
    }

    function updateFileList(files) {
        fileListModel.clear();
        for (var i = 0; i < files.length; i++) {
            fileListModel.append({name: files[i]});
        }
    }

    Component.onCompleted: {
        filesMap = createFilesMap();  // Reconstruir el mapa cuando se inicia la aplicación
    }

    MenuBar {
        width: parent.width
        Menu {
            title: "Archivo"
            Action {
                text: "Nuevo"
                // Conecte la señal "triggered" a su función de manejo
            }
            Action {
                text: "Abrir"
                // Conecte la señal "triggered" a su función de manejo
            }
            Action {
                text: "Guardar"
                // Conecte la señal "triggered" a su función de manejo
            }
        }
        Menu {
            title: "Editar"
            Action {
                text: "Deshacer"
                // Conecte la señal "triggered" a su función de manejo
            }
            Action {
                text: "Rehacer"
                // Conecte la señal "triggered" a su función de manejo
            }
        }
    }
    MyGroupbox {
        id: groupboxTopics
        y: 60

        width: parent.width *0.20
        height: parent.height*0.80

        label: Label {
            color: "#ffffff"
            text: "Topics"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Roboto Mono"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
            font.bold: true
        }

        ScrollViewTopics {
            id: scrollViewTopics
            anchors.fill: parent
            anchors.topMargin: 35
        }
        anchors.horizontalCenterOffset: -470
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle
    {
        id:backGroundStackView
        x: 264
        y: 60
        width: parent.width * 0.75
        height: parent.height *0.80
        radius:15
        StackView {
            id: stackView
            anchors.fill: parent
            anchors.centerIn: parent
            initialItem: "CodeDisplayPage.qml"
            width: 914
            height: 721

        }

    }


    Button {
        id: buttonExplanation
        x: 49
        y: 714
        width: 163
        height: 67
        text: qsTr("Explanation")
        highlighted: false
        flat: false
        antialiasing: true
        Layout.preferredWidth: 114
        Layout.preferredHeight: 42
        onClicked: {
            fileProcessor.processFile(":/Code/Assets/Code/CPlusPlus/Varibable initialization.txt");
        }
    }
}



// ColumnLayout {
//     id:columnLayoutCode
//     width: parent.width
//     height: parent.height
// StackView {
//     id: stackView
//     initialItem: "CodeDisplayPage.qml"
//     Layout.preferredWidth: 1017
//     Layout.preferredHeight: 713
// }

// Button {
//     id: buttonExplanation
//     text: qsTr("Explanation")
//     highlighted: false
//     flat: false
//     antialiasing: true
//     Layout.preferredWidth: 114
//     Layout.preferredHeight: 42
//     onClicked: {
//         fileProcessor.processFile(":/Code/Assets/Code/CPlusPlus/Varibable initialization.txt");
//     }

// }
//     Layout.preferredWidth: 1017
//     Layout.preferredHeight: 787
// }

