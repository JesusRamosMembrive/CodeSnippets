import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "./Modules/ListsOfModels"
import "./Modules/Utils"

MenuBar {
    id: menuBar
    Layout.fillWidth: true

    Menu {
        font.family: "Roboto"
        title: "Options"
        Action {
            text: "Lenguage"
            // Conecte la señal "triggered" a su función de manejo
        }
    }
}
