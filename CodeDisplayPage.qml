import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: codeDisplayPage
    width: parent.width
    height: parent.height
    radius: 15
    color: "#231f1f"

    GridLayout {
        id: mainLayout
        anchors.fill: parent
        columns: 2
        rowSpacing: 10
        columnSpacing: 20

        // Área de código
        Column {
            id: column
            Layout.row: 0
            Layout.column: 0
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                text: "Code Area"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                color: "white"
            }

            Rectangle {
                width: parent.width
                height: parent.height * 0.92
                color: "white"
                radius: 20
                border.width: 2
                anchors.left: parent.left
                anchors.leftMargin: 10
                border.color: "black"

                ScrollView {
                    anchors.fill: parent
                    anchors.margins: 10

                    TextArea {
                        id: textAreaCode
                        x: 0
                        y: 0
                        // wrapMode: Text.WordWrap
                        hoverEnabled: false
                        renderType: Text.QtRendering
                        textFormat: Text.PlainText
                        readOnly: true
                        text: "Aquí va a ir el código"
                        font.pointSize: 13
                        font.family: "Bookerly"
                        placeholderText: qsTr("Text Area")
                        color: "#000000"

                        background: Rectangle {
                            color: "transparent"
                            radius: 20
                        }
                    }
                }
            }
        }

        // Área de archivos
        Column {
            id: columnFiles
            Layout.minimumWidth: 110
            Layout.minimumHeight: 0
            Layout.row: 0
            Layout.column: 1
            Layout.fillHeight: true

            Text {
                text: "Files"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                color: "white"
                anchors.rightMargin: 10
            }

            Rectangle {
                id: backGroundFileListView
                color: "white"
                height: parent.height * 0.92
                width: parent.width
                radius: 20
                anchors.right: parent.right
                anchors.rightMargin: 10

                ListView {
                    id: fileListView
                    width: parent.width
                    height: parent.height
                    model: fileProcessor.files
                    delegate: Item {
                        width: parent.width
                        height: 40

                        Rectangle {
                            width: parent.width
                            height: parent.height
                            color: "#ffffff"
                            border.color: "lightgray"
                            border.width: 1
                            radius: 20

                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                font.pixelSize: 16
                                color: "black"
                            }

                            MouseArea {
                                id: itemMouseArea
                                anchors.fill: parent
                                onClicked: {
                                    fileProcessor.getFileContent(modelData);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Connections {
        target: fileProcessor
        onFileSelected: {
            console.log("=============SE ACTIVA????=================");
            textAreaCode.text = fileContent;
        }
    }
}












// import QtQuick
// import QtQuick.Window
// import QtQuick.Controls
// import QtQuick.Layouts

// import "./Components"

// Rectangle {
//     width: parent.width
//     height: parent.height
//     radius: 15
//     color: "#231f1f"

//     GridLayout {
//         id: mainLayout
//         anchors.fill: parent
//         columns: 2
//         rowSpacing: 10
//         columnSpacing: 20

//         // Área de código
//         Column {
//             id: column
//             Layout.row: 0
//             Layout.column: 0
//             Layout.fillWidth: true
//             Layout.fillHeight: true

//             Text {
//                 text: "Code Area"
//                 anchors.horizontalCenter: parent.horizontalCenter
//                 font.pointSize: 20
//                 color: "white"
//             }

//             Rectangle {
//                 width: parent.width
//                 height: parent.height *0.92
//                 color: "white"
//                 radius: 20
//                 border.width: 2
//                 anchors.left: parent.left
//                 anchors.leftMargin: 10
//                 border.color: "black"

//                 ScrollView {
//                     anchors.fill: parent
//                     anchors.margins: 10

//                     TextArea {
//                         id: textAreaCode
//                         wrapMode: Text.WordWrap
//                         textFormat: Text.MarkdownText
//                         readOnly: true
//                         text: "Aqui va a ir el codigo"
//                         font.pointSize: 22
//                         font.family: "Bookerly"
//                         placeholderText: qsTr("Text Area")
//                         color: "#000000"

//                         background: Rectangle {
//                             color: "transparent"
//                             radius: 20
//                         }
//                     }
//                 }
//             }
//         }

//         // Área de archivos
//         Column {
//             id: columnFiles
//             Layout.minimumWidth: 110
//             Layout.minimumHeight: 0
//             Layout.row: 0
//             Layout.column: 1
//             // Layout.fillWidth: true
//             Layout.fillHeight: true

//             Text {
//                 text: "Files"
//                 anchors.horizontalCenter: parent.horizontalCenter
//                 font.pointSize: 20
//                 color: "white"
//                 anchors.rightMargin: 10
//             }

//             Rectangle {
//                 id: backGroundFileListView
//                 color: "black"
//                 height: parent.height * 0.92
//                 width: parent.width
//                 radius: 20
//                 anchors.right: parent.right
//                 anchors.rightMargin: 10

//                 ListView {
//                     id: fileListView
//                     width: parent.width
//                     height: parent.height
//                     model: fileProcessor.files
//                     delegate: Item {
//                         width: parent.width
//                         height: 40

//                         Rectangle {
//                             id: rectangleFiles
//                             width: parent.width
//                             height: parent.height
//                             color: "#ffffff"
//                             border.color: "lightgray"
//                             border.width: 1
//                             radius: 10

//                             Text {
//                                 anchors.centerIn: rectangleFiles
//                                 text: model.key
//                                 font.pixelSize: 16
//                                 color: "black"
//                             }

//                             MouseArea {
//                                 id: itemMouseArea
//                                 anchors.fill: parent
//                                 onClicked: {
//                                     fileProcessor.getFileContent(model.key)
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }

//     Connections {
//         target: fileProcessor
//         onFileSelected: {
//             console.log("=============SE ACTIVA????=================");
//             textAreaCode.text = fileContent
//         }
//     }
// }
