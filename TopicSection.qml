import QtQuick

Column {
    id: topicSection
    width: parent.width
    spacing: 10

    property alias buttonText: topicButton.buttonText
    property alias model: customListView.customModel
    property alias searchFilter: customListView.searchFilter

    CustomButton {
        id: topicButton
        width: parent.width * 0.9
        height: 40
        buttonText: "Button Text"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    CustomListView {
        id: customListView
        width: parent.width
        customButton: topicButton
    }
}
