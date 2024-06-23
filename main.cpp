#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QQmlModuleRegistration>
#include "./Modules/FileProcessor/fileprocessor.h"
#include "./Modules/FileProcessor/markdownprocessor.h"
#include "./Modules/FileProcessor/filelister.h"
#include "./Modules/FileProcessor/jsonhandler.h"
#include "filesystemmodel.h"
#include <QtWebEngineQuick/qtwebenginequickglobal.h>
#include <QCommandLineParser>

int main(int argc, char *argv[])
{

    QtWebEngineQuick::initialize();

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    FileProcessor fileProcessor;
    engine.rootContext()->setContextProperty("fileProcessor", &fileProcessor);

    MarkdownProcessor markdownProcessor;
    engine.rootContext()->setContextProperty("markdownProcessor", &markdownProcessor);

    JsonHandler jsonHandler;
    engine.rootContext()->setContextProperty("jsonHandler", &jsonHandler);

    qmlRegisterType<FileLister>("FileLister", 1, 0, "FileLister");
    qmlRegisterType<FileSystemModel>("FileSystemModel", 1, 0, "FileSystemModel");


    // Setup the parser and parse the command-line arguments.
    QCommandLineParser parser;
    parser.setApplicationDescription("Qt Filesystemexplorer Example");
    parser.addHelpOption();
    parser.addVersionOption();
    parser.addPositionalArgument("", QGuiApplication::translate(
                                         "main", "Initial directory"),"[path]");
    parser.process(app);
    const auto args = parser.positionalArguments();



    const QUrl url(u"qrc:/CodeSnippetApp/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    // Set the initial directory if provided
    if (args.length() == 1) {
        auto *fileSystemModel = engine.singletonInstance<FileSystemModel*>(
            "FileSystemModule","FileSystemModel");
        fileSystemModel->setInitialDirectory(args[0]);
    }

    return app.exec();
}
