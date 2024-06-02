#pragma once
#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QMap>
#include <QVariant>
#include <QVariantList>
#include <QDebug>

class FileProcessor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString explanation READ explanation NOTIFY explanationChanged)
    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    Q_PROPERTY(QVariantList files READ files NOTIFY filesChanged)

public:
    explicit FileProcessor(QObject *parent = nullptr);

    Q_INVOKABLE void processFile(const QString &filePath);
    Q_INVOKABLE QString getFileContent(const QString &fileName);
    Q_INVOKABLE QString getFileTitle(const QString &fileName);

    QString explanation() const { return m_explanation; }
    QString title() const { return m_title; }
    QVariantList files() const { return m_filesList; }

signals:
    void explanationChanged();
    void filesChanged();
    void titleChanged();
    void fileSelected(const QString &fileName, const QString &fileContent, const QString &fileTitle);

private:
    QString m_explanation;
    QString m_title;
    QMap<QString, QString> m_files;
    QVariantList m_filesList;

    void extractSection(const QString &text, const QString &startMarker, const QString &endMarker, QString &section);
};
