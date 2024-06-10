import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "./Modules/Utils"

MenuBar {
    id: menuBar
    Layout.fillWidth: true

    signal setPathsTriggered

    Menu {
        font.family: "Roboto"
        title: "Options"
        Action {
            text: "Set Paths"
            onTriggered: {
                menuBar.setPathsTriggered()

            }
        }
    }
}
