#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>

#include "./Modules/FileProcessor/fileprocessor.h"
#include "./Modules/FileProcessor/markdownprocessor.h"
#include "./Modules/FileProcessor/filelister.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    // QtWebEngineQuick::initialize();

    qDebug() << "ResourceReader creado"; // Mover el debug aquí para confirmar la creación
    FileProcessor fileProcessor;
    MarkdownProcessor markdownProcessor;
    FileLister fileLister;
    engine.rootContext()->setContextProperty("fileProcessor", &fileProcessor);
    engine.rootContext()->setContextProperty("markdownProcessor", &markdownProcessor);
engine.rootContext()->setContextProperty("fileLister", &fileLister);

    const QUrl url(u"qrc:/CodeSnippetApp/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
