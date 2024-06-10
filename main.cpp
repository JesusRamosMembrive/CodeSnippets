#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QQmlModuleRegistration>
#include "./Modules/FileProcessor/fileprocessor.h"
#include "./Modules/FileProcessor/markdownprocessor.h"
#include "./Modules/FileProcessor/filelister.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    FileProcessor fileProcessor;
    engine.rootContext()->setContextProperty("fileProcessor", &fileProcessor);

    MarkdownProcessor markdownProcessor;
    engine.rootContext()->setContextProperty("markdownProcessor", &markdownProcessor);

    // FileLister fileLister;
    // engine.rootContext()->setContextProperty("fileLister", &fileLister);
    qmlRegisterType<FileLister>("FileLister", 1, 0, "FileLister");

    const QUrl url(u"qrc:/CodeSnippetApp/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
