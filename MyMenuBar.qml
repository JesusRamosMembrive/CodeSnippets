import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

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
