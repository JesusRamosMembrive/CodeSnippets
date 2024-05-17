#pragma once
#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QMap>
#include <QVariant>
#include <QVariantList>

class FileProcessor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString result READ result NOTIFY resultChanged)
    Q_PROPERTY(QString explanation READ explanation NOTIFY explanationChanged)
    Q_PROPERTY(QVariantList files READ files NOTIFY filesChanged)

public:
    explicit FileProcessor(QObject *parent = nullptr);

    Q_INVOKABLE void processFile(const QString &filePath);
    Q_INVOKABLE QString getFileContent(const QString &fileName);

    QString result() const { return m_result; }
    QString explanation() const { return m_explanation; }
    QVariantList files() const { return m_filesList; }

signals:
    void resultChanged();
    void explanationChanged();
    void filesChanged();
    void fileSelected(const QString &fileName, const QString &fileContent);

private:
    QString m_result;
    QString m_explanation;
    QMap<QString, QString> m_files;
    QVariantList m_filesList;

    void extractSection(const QString &text, const QString &startMarker, const QString &endMarker, QString &section);
};
