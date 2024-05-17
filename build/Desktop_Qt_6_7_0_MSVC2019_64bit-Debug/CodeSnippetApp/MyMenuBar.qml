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
                title: "Archivo"
                Action {
                    text: "Nuevo"
                    // Conecte la señal "triggered" a su función de manejo
                }
            }
            Menu {
                title: "Editar"
                Action {
                    text: "Deshacer"
                    // Conecte la señal "triggered" a su función de manejo
                }
            }
        }
