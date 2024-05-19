cmake_minimum_required(VERSION 3.16)

project(CodeSnippetApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appCodeSnippetApp
    main.cpp
    resources.qrc
)

qt6_add_qml_module(appCodeSnippetApp
    URI CodeSnippetApp
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES MyGroupbox.qml
    QML_FILES CodeDisplayPage.qml
    QML_FILES Components/CustomTextArea.qml
    QML_FILES Modules/ListsOfModels/DataTypesModel.qml
    QML_FILES Modules/ListsOfModels/ControlFlowModels.qml
    QML_FILES Modules/ListsOfModels/MapOfAssociations.qml
    QML_FILES Modules/Utils/FileReader.qml
    SOURCES Modules/FileProcessor/fileprocessor.h Modules/FileProcessor/fileprocessor.cpp
    QML_FILES ScrollViewTopics.qml
    RESOURCES ScrollViewNotes
    QML_FILES CustomButton.qml
    QML_FILES CustomListView.qml
    QML_FILES FilesListView.qml
    RESOURCES Modules/Notes/MyGroupBoxComponent
    QML_FILES DialogExit.qml
    QML_FILES CustomMouseAreaResize.qml
    QML_FILES MyTitleBar.qml
    QML_FILES MyMenuBar.qml
    QML_FILES ExplanationPage.qml
    QML_FILES Theme.qml

)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCodeSnippetApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCodeSnippetApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCodeSnippetApp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appCodeSnippetApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
