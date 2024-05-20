import QtQuick

Item {
    property ListModel loopsTypeModel: ListModel {
        ListElement { name: "BreakAndContinues" }
        ListElement { name: "CommaOperator" }
        ListElement { name: "DoWhile" }
        ListElement { name: "ExampleInfiniteLoop" }
        ListElement { name: "For" }
        ListElement { name: "IncreasingDecreasingLoops" }
        ListElement { name: "NestedLoops" }
        ListElement { name: "RangeBasedLoops" }
        ListElement { name: "While" }
    }
}
