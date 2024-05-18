import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
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
        spacing: 20


        Rectangle{
            id:fakeRectangle
            width:80
            height: 40
            color:"transparent"
            border.color: "#00000000"
        }

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
