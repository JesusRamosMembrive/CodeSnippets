#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>

#include "./Modules/FileProcessor/fileprocessor.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qDebug() << "ResourceReader creado"; // Mover el debug aquí para confirmar la creación
    FileProcessor fileProcessor;
    engine.rootContext()->setContextProperty("fileProcessor", &fileProcessor);

    const QUrl url(u"qrc:/CodeSnippetApp/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
