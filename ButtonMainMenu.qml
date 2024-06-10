import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Control {
    id: buttonMenu
    width: 300
    height: 150

    property alias iconSource: icon.source
    property alias textTitle: buttonText.text
    property alias textSubTitle: subTitleText.text

    // Fondo blanco con bordes redondeados
    Rectangle {
        id: backgroundRect
        width: buttonMenu.width
        height: buttonMenu.height
        color: "#ffffff"
        radius: 15
        border.color: "#ffffff"
        border.width: 0
    }

    HoverHandler {
        id: hoverHandler
        enabled: true
        cursorShape: Qt.PointingHandCursor
        onHoveredChanged: {
            if (hovered) {
                colorAnimation.running = false
                colorAnimation.from = backgroundRect.color
                colorAnimation.to = "#fef068"
                colorAnimation.running = true
            } else {
                colorAnimation.running = false
                colorAnimation.from = backgroundRect.color
                colorAnimation.to = "#ffffff"
                colorAnimation.running = true
            }
        }
    }

    PropertyAnimation {
        id: colorAnimation
        target: backgroundRect
        property: "color"
        duration: 500 // Duración de la animación en milisegundos
    }


    // Parte superior azul con esquinas superiores redondeadas
    Rectangle {
        id: rectangle
        width: buttonMenu.width
        height: buttonMenu.height * 0.2
        radius: 15
        color: "#123456"
        // anchors.top: parent.top

        // Ocultar las esquinas inferiores del rectángulo azul
        Rectangle {
            width: parent.width
            height: parent.height / 2
            color: "#123456"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 0
            border.width: 0
        }

        Rectangle {
            id: titleRectangle
            height: rectangle.height
            width: buttonMenu.width * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#123456"

            Text {
                id: buttonText
                text: "Titulo a rellenar"
                font.pixelSize: 20
                font.family: "Roboto"
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#ffffff"
                font.bold: true
            }
        }
    }

    Text {
        id: subTitleText
        y: 36
        width: parent.width * 0.9
        height: 22
        text: "Sub Texto a rellenar"
        anchors.topMargin: 0
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        font.family: "Roboto"
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#888888"
    }

    Image {
        id: icon
        source: "Assets/Images/school.png"
        sourceSize.height: 180
        sourceSize.width: 180
        fillMode: Image.Stretch
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: 54
        height: 47
        anchors.top: parent.top
        anchors.topMargin: 64
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            buttonMenu.clicked()
        }
    }

    signal clicked
}
