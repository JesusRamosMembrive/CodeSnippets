import QtQuick

Item {
    property ListModel controlFlowTypes: ListModel {
        ListElement { name: "IfElse" }
        ListElement { name: "shortcircuitEvaluation" }
        ListElement { name: "SwitchCase" }
        ListElement { name: "TernaryOperator" }
    }
}
