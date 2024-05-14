import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 400
    height: 400
    color: "white"  // Color de fondo del rectángulo
    radius: 25        // Esquinas redondeadas
    border.width: 2
    border.color: "black"

    property alias text: textAreaCustom.text

    TextArea {
        id: textAreaCustom
        anchors.fill: parent
        anchors.margins: 10 // Agrega un margen para que el borde del Rectangle sea visible
        wrapMode: Text.WordWrap
        text: "Aqui va a ir el codigo"
        font.pointSize: 22
        font.family: "Bookerly"
        placeholderText: qsTr("Text Area")
        color: "#000000"  // Color del texto
        background: Rectangle {  // Fondo personalizado para TextArea
            color: "transparent"  // Fondo transparente para ver el color del Rectangle padre
            radius: 20  // Esquinas ligeramente más redondeadas que el padre para alinear visualmente
        }
    }
}

