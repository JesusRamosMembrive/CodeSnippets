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
        height: 35
        buttonText: "Button Text"
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            customListView.visible = !customListView.visible;
            topicSection.resetHeight();
        }
    }

    CustomListView {
        id: customListView
        width: parent.width
        customModel: model
        visible: false
    }

    function resetHeight() {
        customListView.resetHeight();
    }
}
