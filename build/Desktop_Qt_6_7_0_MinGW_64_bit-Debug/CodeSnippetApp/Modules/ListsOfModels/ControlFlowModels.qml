import QtQuick

Item {
    property ListModel controlFlowTypes: ListModel {
        ListElement { name: "For Loops" }
        ListElement { name: "While" }
        ListElement { name: "Do While" }
        ListElement { name: "Other" }
    }
}
