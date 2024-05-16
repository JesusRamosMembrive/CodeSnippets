import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects

import "./Modules/ListsOfModels"
import "./Modules/Utils"

Window {
    id: appWindow
    width: 1200
    height: 900
    visible: true
    color: "transparent"
    title: qsTr("Code Snippets")
    Material.theme: Material.Dark
    Material.accent: Material.Orange

    flags: Qt.FramelessWindowHint | Qt.WA_TranslucentBackground

    // Background Blur Effect
    // Area de encabezado para mover la ventana

    // MenuBar
    MenuBar {
        id: menuBar
        width: parent.width
        Menu {
            title: "Archivo"
            Action {
                text: "Nuevo"
                // Conecte la señal "triggered" a su función de manejo
            }
        }
        Menu {
            title: "Editar"
            Action {
                text: "Deshacer"
                // Conecte la señal "triggered" a su función de manejo
            }
        }
    }
    Rectangle {
        id: titleBar
        width: appWindow.width
        height: 45
        color: "#6076d5fe"
        opacity: 0.5
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onPressed: {
                appWindow.startSystemMove()
            }
        }

        // Botón de cierre
        Button {
            id: closeButton
            x: 1110
            y: 0
            width: 90
            height: 45
            text: "X"
            // anchors.top: appWindow.top
            // anchors.right: appWindow.right
            // anchors.margins: 5
            // anchors.rightMargin: 8
            // anchors.topMargin: 8
            onClicked: {
                Qt.quit()
            }
            background: Rectangle
            {
                id: bgCloseButton
                color: "#ff0000"
                radius: 20

            }
        }
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


    MyGroupbox {
        id: groupboxTopics

        width: parent.width *0.20
        height: parent.height*0.80
        anchors.leftMargin: -1200
        anchors.rightMargin: -240
        anchors.topMargin: -845
        anchors.bottomMargin: -775

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
        anchors.horizontalCenterOffset: -480
    }

    Rectangle
    {
        id:backGroundStackView
        x: 261
        y: 55
        width: parent.width * 0.75
        height: parent.height *0.80
        color: "#00ffffff"
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
        x: 28
        y: 805
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

    // Areas for resizing the window
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        width: 10
        height: 10
        cursorShape: Qt.SizeFDiagCursor
        onPressed: {
            appWindow.startSystemResize(Qt.TopLeftCorner)
        }
    }

    MouseArea {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 10
        height: 10
        cursorShape: Qt.SizeBDiagCursor
        onPressed: {
            appWindow.startSystemResize(Qt.TopRightCorner)
        }
    }

    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 10
        height: 10
        cursorShape: Qt.SizeBDiagCursor
        onPressed: {
            appWindow.startSystemResize(Qt.BottomLeftCorner)
        }
    }

    MouseArea {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 10
        height: 10
        cursorShape: Qt.SizeFDiagCursor
        onPressed: {
            appWindow.startSystemResize(Qt.BottomRightCorner)
        }
    }

    MouseArea {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 10
        cursorShape: Qt.SizeVerCursor
        onPressed: {
            appWindow.startSystemResize(Qt.BottomEdge)
        }
    }

    MouseArea {
        anchors.right: parent.right
        width: 10
        height: parent.height
        cursorShape: Qt.SizeHorCursor
        onPressed: {
            appWindow.startSystemResize(Qt.RightEdge)
        }
    }

    MouseArea {
        anchors.left: parent.left
        width: 10
        height: parent.height
        cursorShape: Qt.SizeHorCursor
        onPressed: {
            appWindow.startSystemResize(Qt.LeftEdge)
        }
    }

    MouseArea {
        anchors.top: parent.top
        width: parent.width
        height: 10
        cursorShape: Qt.SizeVerCursor
        onPressed: {
            appWindow.startSystemResize(Qt.TopEdge)
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

