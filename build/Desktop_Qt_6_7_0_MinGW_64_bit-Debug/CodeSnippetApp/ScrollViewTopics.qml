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


        CustomButton
        {
            id: dataTypeButton
            width: columnTopics.width * 0.8
            height: 40
            buttonText: "Variables & Data Types"
        }

        CustomListView {
            id: dataTypeList
            width: parent.width
            customModel: dataTypesModel.dataTypes  // Pasa el modelo al CustomListView
            customButton: dataTypeButton  // Pasa el botón al CustomListView para controlar la visibilidad
        }
    }
}
