#pragma once

#include <QObject>
#include <QDir>
#include <QVariantList>
#include <QDebug>

class FileLister : public QObject
{
    Q_OBJECT
public:
    explicit FileLister(QObject *parent = nullptr);
    Q_INVOKABLE QVariantMap createFilesMap(const QString &basePath);

private:
    QVariantList listFilesInDirectory(const QDir &directory);
};
