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
            buttonText: "Estructura de datos"
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
            customModel: amigasModel.amigasType
            customButton: friendsButton
            searchFilter: textField.text
        }

        CustomButton {
            id: constAndStaticMembersButton
            width: widthButtons
            height: 40
            buttonText: "Const and static members"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: constAndStaticMembersList
            width: parent.width
            customModel: constYMiembrosEstaticosModel.miemborsStaticYConstType
            customButton: constAndStaticMembersButton
            searchFilter: textField.text
        }

        CustomButton {
            id: namespaceButton
            width: widthButtons
            height: 40
            buttonText: "Namespace"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: namespaceList
            width: parent.width
            customModel: namespacesModel.namespaceType
            customButton: namespaceButton
            searchFilter: textField.text
        }

        CustomButton {
            id: gestionMemoriaButton
            width: widthButtons
            height: 40
            buttonText: "Const and static members"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: gestionMemoriaList
            width: parent.width
            customModel: manejoMemoriaModel.gestionDeLaMemoriaType
            customButton: gestionMemoriaButton
            searchFilter: textField.text
        }

        CustomButton {
            id: sobrecargaButton
            width: widthButtons
            height: 40
            buttonText: "Sobrecarga de operadores"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: sobrecargaList
            width: parent.width
            customModel: operadorSobrecargaModel.sobrecargaDeOperadoresType
            customButton: sobrecargaButton
            searchFilter: textField.text
        }

        CustomButton {
            id: templatesButton
            width: widthButtons
            height: 40
            buttonText: "Plantillas"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: templatesList
            width: parent.width
            customModel: plantillasYGenericasModel.plantillasType
            customButton: templatesButton
            searchFilter: textField.text
        }

        CustomButton {
            id: conceptsButton
            width: widthButtons
            height: 40
            buttonText: "Concepts"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: conceptsList
            width: parent.width
            customModel: conceptsModel.conceptsType
            customButton: conceptsButton
            searchFilter: textField.text
        }

        CustomButton {
            id: semanticButton
            width: widthButtons
            height: 40
            buttonText: "Semantics"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: semanticList
            width: parent.width
            customModel: semanticsModel.semanticsType
            customButton: semanticButton
            searchFilter: textField.text
        }

        CustomButton {
            id: functionsLikeEntitiesButton
            width: widthButtons
            height: 40
            buttonText: "Funciones como entidades"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: functionsLikeEntitiesList
            width: parent.width
            customModel: funcionesComoEntidadesModel.funcionesComoEntidadesType
            customButton: functionsLikeEntitiesButton
            searchFilter: textField.text
        }

        CustomButton {
            id: iteratorButton
            width: widthButtons
            height: 40
            buttonText: "Iteradores"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: iteratorList
            width: parent.width
            customModel: iteradoresModel.iteradoresType
            customButton: iteratorButton
            searchFilter: textField.text
        }

        CustomButton {
            id: stdAlgorithmsButton
            width: widthButtons
            height: 40
            buttonText: "std::algorithms"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomListView {
            id: stdAlgorithmsList
            width: parent.width
            customModel: stdAlgoritmosModel.stdAlgorithmsType
            customButton: stdAlgorithmsButton
            searchFilter: textField.text
        }
    }
}
