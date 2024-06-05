import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Dialogs

import "./Modules/ListsOfModels"
import "./Modules/Utils"

MessageDialog {
        id: messageDialog
        title: qsTr("Confirmar salida")
        text: qsTr("¿Estás seguro de que deseas cerrar la aplicación?")
        buttons: MessageDialog.Ok | MessageDialog.Cancel
        onButtonClicked: function (button, role) {
            switch (button) {
            case MessageDialog.Ok:
                Qt.quit()
                break;
            }

        }
    }
