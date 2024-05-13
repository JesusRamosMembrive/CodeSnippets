#pragma once
#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QMap>
#include <QVariant>
#include <QVariantMap>



class FileProcessor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString result READ result NOTIFY resultChanged)
    Q_PROPERTY(QString explanation READ explanation NOTIFY explanationChanged)
    Q_PROPERTY(QVariantMap files READ files NOTIFY filesChanged)

public:
    explicit FileProcessor(QObject *parent = nullptr);

    Q_INVOKABLE void processFile(const QString &filePath);

    QString result() const { return m_result; }
    QString explanation() const { return m_explanation; }
    QVariantMap files() const { return m_files; }

signals:
    void resultChanged();
    void explanationChanged();
    void filesChanged();

private:
    QString m_result;
    QString m_explanation;
    QVariantMap m_files;

    void extractSection(const QString &text, const QString &startMarker, const QString &endMarker, QString &section);
};

