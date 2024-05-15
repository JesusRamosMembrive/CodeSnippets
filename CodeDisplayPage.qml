import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "./Components"

Rectangle {
       width: parent.width
       height: parent.height
       color: "black"  // Fondo negro para el área de código

       GridLayout {
           id: mainLayout
           anchors.fill: parent
           columns: 2
           rowSpacing: 10
           columnSpacing: 20
           margins: 20

           // Área de código
           ColumnLayout {
               Layout.row: 0
               Layout.column: 0

               Text {
                   text: "Code Area"
                   font.pointSize: 20
                   color: "white"
               }

               Rectangle {
                   width: parent.width
                   height: parent.height
                   color: "white"
                   radius: 25
                   border.width: 2
                   border.color: "black"

                   ScrollView {
                       anchors.fill: parent
                       anchors.margins: 10

                       TextArea {
                           id: textAreaCode
                           wrapMode: Text.WordWrap
                           textFormat: Text.MarkdownText
                           readOnly: true
                           text: "Aqui va a ir el codigo"
                           font.pointSize: 22
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
           ColumnLayout {
               Layout.row: 0
               Layout.column: 1

               Text {
                   text: "Files"
                   font.pointSize: 20
                   color: "white"
               }

               CustomListView {
                   id: fileListView
                   width: parent.width * 0.8
                   height: parent.height * 0.8
                   customModel: dataTypesModel.dataTypes  // Pasa el modelo al CustomListView
                   customButton: dataTypeButton  // Pasa el botón al CustomListView para controlar la visibilidad
               }
           }
       }
   }


















// import QtQuick
// import QtQuick.Window
// import QtQuick.Controls
// import QtQuick.Layouts
// import "./Components"

// Rectangle{
//     id: backGroundCodeZone
//     height: parent.height
//     width: parent.width
//     radius:15
//     color: "black"

//     Row
//     {
//         id: rowCodeDisplay
//         height: parent.height
//         width: parent.width
//         spacing: 5

//         Column {
//             id: columnCodeDisplay
//             width: backGroundCodeZone.width
//             height: backGroundCodeZone.height
//             // spacing: 20

//             Text {
//                 id: titleTopic
//                 width: columnCodeDisplay.width
//                 height: 30
//                 color: "#ffffff"
//                 text: qsTr("Code Area")
//                 font.pixelSize: 26
//             }

//             CustomTextArea {
//                 id: textAreaCode
//                 width: backGroundCodeZone.width * 0.85
//                 height: backGroundCodeZone.height * 0.99
//                 anchors.top: parent.top
//                 anchors.leftMargin: 10
//                 anchors.topMargin: 40
//             }

//         }

//         Column {
//             id: columnFilesDisplay
//             width: parent.width *0.2
//             height: parent.height * 0.8
//             spacing: 20

//             Text {
//                 id: titleFiles
//                 width: parent.width
//                 height: 30
//                 color: "#ffffff"
//                 text: qsTr("Files")
//                 font.pixelSize: 25
//             }
//             FilesListView {
//                 id:filesListView
//                 width: backGroundCodeZone.width * 0.2
//                 height: backGroundCodeZone.height * 0.8
//                 // anchors.left: textAreaCode.right
//                 anchors.top: parent.top
//                 // anchors.leftMargin: 10
//                 anchors.topMargin: 40
//             }
//         }
//     }
//     property alias textCode: textAreaCode.text
// }


