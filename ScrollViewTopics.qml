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
            id: dataTypeButton
            width: widthButtons
            height: 40
            buttonText: "Variables & Data Types"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: dataTypeList
            width: parent.width
            customModel: dataTypesModel.dataTypes
            customButton: dataTypeButton
            searchFilter: textField.text
        }

        CustomButton {
            id: literalAndConstantsButton
            width: widthButtons
            height: 40
            buttonText: "Literal and constants"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: literalAndConstantsList
            width: parent.width
            customModel: literalConstants.literalConstantsType
            customButton: literalAndConstantsButton
            searchFilter: textField.text
        }

        CustomButton {
            id: flowControlButton
            width: widthButtons
            height: 40
            buttonText: "Flow control"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: flowControlsList
            width: parent.width
            customModel: controlFlowModel.controlFlowTypes
            customButton: flowControlButton
            searchFilter: textField.text
        }

        CustomButton {
            id: bitWiseButton
            width: widthButtons
            height: 40
            buttonText: "Bitwise"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: bitWiseList
            width: parent.width
            customModel: bitWiseType.bitWiseModel
            customButton: bitWiseButton
            searchFilter: textField.text
        }

        CustomButton {
            id: loopsButton
            width: widthButtons
            height: 40
            buttonText: "Loops"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: loopsList
            width: parent.width
            customModel: loops.loopsTypeModel
            customButton: loopsButton
            searchFilter: textField.text
        }

        CustomButton {
            id: overflowButton
            width: widthButtons
            height: 40
            buttonText: "Overflow"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: overflowList
            width: parent.width
            customModel: overflow.overFlowTypes
            customButton: overflowButton
            searchFilter: textField.text
        }
    }
}
