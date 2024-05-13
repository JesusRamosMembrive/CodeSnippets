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
    title: qsTr("Hello World")
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

    Component.onCompleted: {
        filesMap = createFilesMap();  // Reconstruir el mapa cuando se inicia la aplicación
    }

    MyGroupbox {
        id: groupboxLanguage
        x: 20
        y: 47
        height: parent.height * 0.10
        width: parent.width *0.15

        label: Label {
            color: "#ffffff"
            text: "Lenguage"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 11
            font.bold: true
            anchors.horizontalCenter: groupboxLanguage.horizontalCenter
        }
        ComboBox {
            id: comboBox
            width: groupboxLanguage.width *0.9
            height: groupboxLanguage.height *0.5
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            model: ["C++"]
        }
    }

    MyGroupbox {
        id: groupboxTopics
        x: 12
        y: 133
        width: parent.width *0.20
        height: parent.height*0.85

        ScrollView {
                            id: scrollViewTopics
                            anchors.fill: parent

                            Column {
                                id: columnTopics
                                width: parent.width
                                spacing: 10
                                ToolButton {
                                    id: dataTypeButton
                                    width: parent.width
                                    text: "Variables & Data Types"
                                    contentItem: Text {
                                        color: dataTypeButton.down ? "#ffffff" : "#000000"
                                        text: dataTypeButton.text
                                    }
                                    checkable: true
                                    background: Rectangle {
                                        color: dataTypeButton.checked ? "#4CAF50" : "#f0f0f0"
                                        radius: 5
                                    }
                                }

                                ListView {
                                    id: dataTypeList
                                    width: parent.width
                                    height: visible ? contentHeight : 0
                                    visible: dataTypeButton.checked
                                    model: dataTypesModel.dataTypes  // Utiliza el modelo de dataTypesModel
                                    delegate: ItemDelegate {
                                        width: parent.width
                                        text: modelData
                                        font.pixelSize: 16
                                        onClicked: {
                                            console.log("Clicked on", modelData)
                                            loadFile(modelData)
                                            // Agregar más acciones aquí si es necesario
                                        }
                                    }
                                }

                                ToolButton {
                                    id: controlFlowButton
                                    width: parent.width
                                    text: "Control Flow"
                                    contentItem: Text {
                                        color: controlFlowButton.down ? "#ffffff" : "#000000"
                                        text: controlFlowButton.text
                                    }
                                    checkable: true
                                    background: Rectangle {
                                        color: controlFlowButton.checked ? "#4CAF50" : "#f0f0f0"
                                        radius: 5
                                    }
                                }


                                ListView {
                                    id: controlFlowList
                                    width: parent.width
                                    height: visible ? contentHeight : 0
                                    visible: controlFlowButton.checked
                                    model: controlFlowModel.controlFlowTypes  // Utiliza el modelo de dataTypesModel
                                    delegate: ItemDelegate {
                                        width: parent.width
                                        text: modelData
                                        font.pixelSize: 16
                                        onClicked: {
                                            console.log("Clicked on", modelData)
                                            loadFile(modelData)
                                        }
                                    }
                                }
                            }
                        }
                        anchors.horizontalCenterOffset: 0
                        anchors.horizontalCenter: parent.horizontalCenter

    }

    StackView {
        id: stackView
        x: 290
        y: 30
        initialItem: "CodeDisplayPage.qml"
        width: 894
        height: 600

    }

    Button {
        id: buttonExplanation
        x: 604
        y: 723
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

