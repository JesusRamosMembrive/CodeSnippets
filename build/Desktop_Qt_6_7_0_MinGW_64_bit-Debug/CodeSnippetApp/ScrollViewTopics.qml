import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "./Modules/ListsOfModels"
import "./Modules/Utils"

ScrollView {
    id: scrollViewTopics
    width: parent.width
    height: parent.height

    Column {
        id: columnTopics
        width: scrollViewTopics.width
        height: scrollViewTopics.height
        spacing: 10


        CustonButtomMenu {
            id: custonButtomMenu
            buttonText: "Variables & Data Types"

        }

        ListView {
            id: dataTypeList
            width: parent.width
            height: custonButtomMenu.checked ? contentHeight : 0
            visible: custonButtomMenu.checked
            model: dataTypesModel.dataTypes  // Utiliza el modelo de dataTypesModel
            delegate: ItemDelegate {
                width: parent.width
                text: modelData
                font.pixelSize: 16
                onClicked: {
                    console.log("Clicked on", modelData)
                    loadFile(modelData)
                    // Agregar más acciones aquí si es necesario
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 350
                    easing.type: Easing.OutExpo
                }
            }
        }
    }
}
