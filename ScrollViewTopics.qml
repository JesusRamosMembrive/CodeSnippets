import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "./Modules/ListsOfModels"
import "./Modules/Utils"

ScrollView {
    id: scrollViewTopics
    width: parent.width
    height: parent.height
    antialiasing: true
    font.family: "Roboto"

    property int widthButtons: columnTopics.width * 0.9


    Column {
        id: columnTopics
        width: scrollViewTopics.width
        height: scrollViewTopics.height
        topPadding: 5
        spacing: 10

        Label {
            color: "#ffffff"
            text: "Topics"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
            font.bold: true
        }

        TextField {
            id: textField
            width: columnTopics.width * 0.8
            height: 50
            horizontalAlignment: Text.AlignLeft
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Search a topic")
            onTextChanged: {
                appWindow.filterTopics(text);
            }
        }

        Rectangle {
            id: lineSeparatorTopics
            width: widthButtons
            height: 1  // Altura fina para el separador
            color: "white"  // Color blanco
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomButton {
            id: fundamentosButton
            width: widthButtons
            height: 40
            buttonText: "Fundamentos"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: dataTypeList
            width: parent.width
            customModel: fundamentosModel.fundamentosType
            customButton: fundamentosButton
            searchFilter: textField.text
        }

        CustomButton {
            id: controlDeFlujoButton
            width: widthButtons
            height: 40
            buttonText: "Control de flujo"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: controlDeFlujoList
            width: parent.width
            customModel: controlDeFlujoModel.controlDeFlujoType
            customButton: controlDeFlujoButton
            searchFilter: textField.text
        }

        CustomButton {
            id: estructurasDeDatosButton
            width: widthButtons
            height: 40
            buttonText: "Funciones"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: estructurasDeDatosList
            width: parent.width
            customModel: estructurasDeDatosModel.estructurasDeDatosType
            customButton: estructurasDeDatosButton
            searchFilter: textField.text
        }

        CustomButton {
            id: funcionesButton
            width: widthButtons
            height: 40
            buttonText: "Funciones"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: funcionesList
            width: parent.width
            customModel: funcionesModel.funcionesType
            customButton: funcionesButton
            searchFilter: textField.text
        }

        CustomButton {
            id: clasesButton
            width: widthButtons
            height: 40
            buttonText: "Clases"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: clasesList
            width: parent.width
            customModel: pooModel.pooType
            customButton: clasesButton
            searchFilter: textField.text
        }

        CustomButton {
            id: herenciaYPolimorfismoButton
            width: widthButtons
            height: 40
            buttonText: "Herencia y polimorfismo"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: herenciaYPolimorfismoList
            width: parent.width
            customModel: herenciaYPolimorfismoModel.herenciaYPolimorfismoType
            customButton: herenciaYPolimorfismoButton
            searchFilter: textField.text
        }

        CustomButton {
            id: friendsButton
            width: widthButtons
            height: 40
            buttonText: "Friends"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: friendsList
            width: parent.width
            customModel: friendsModel.friendsType
            customButton: friendsButton
            searchFilter: textField.text
        }




    }
}
