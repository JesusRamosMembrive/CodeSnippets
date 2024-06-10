import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Effects

import "./Modules/Utils"
import "./Modules/Style"


Button {
    id: switchToMainPageButton
    width: 180
    height: 75
    anchors.horizontalCenter: parent.horizontalCenter
    text: qsTr("Go to Main Page")
    visible: true
    Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
    background: Rectangle {
        id: bgswitchToMainPageButton
        width: 180
        height: 75
        radius: 33
        border.width: 0
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ef333131"
    }

    HoverHandler {
        id: hoverHandler
        enabled: true
        cursorShape: Qt.PointingHandCursor
        onHoveredChanged: {
            if (hovered) {
                colorAnimation.running = false
                colorAnimation.from = bgswitchToMainPageButton.color
                colorAnimation.to = "goldenrod"
                colorAnimation.running = true
            } else {
                colorAnimation.running = false
                colorAnimation.from = bgswitchToMainPageButton.color
                colorAnimation.to = "#ef333131"
                colorAnimation.running = true
            }
        }
    }

    PropertyAnimation {
        id: colorAnimation
        target: bgswitchToMainPageButton
        property: "color"
        duration: 250 // Duración de la animación en milisegundos
    }
}
