#include "filelister.h"
#include <QDebug>

FileLister::FileLister(QObject *parent) : QObject(parent) {}

QVariantMap FileLister::createFilesMap(const QString &basePath) {
    QVariantMap result;
    QDir dir(basePath);

    if (dir.exists()) {
        // qInfo() << "Base path exists: " << basePath;
        QStringList folders = dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
        for (const QString &folderName : folders) {
            // qInfo() << "Folder: " << folderName;
            QDir folderDir(dir.absoluteFilePath(folderName));
            QStringList files = folderDir.entryList(QDir::Files);
            for (const QString &fileName : files) {
                QString filePath = folderDir.absoluteFilePath(fileName);
                QString key = fileName;
                // qInfo() << "File: " << fileName << " in folder " << folderName;
                result[key] = QVariantMap{
                    {"path", filePath},
                    {"label", folderName}
                };
            }
        }
    } else {
        qWarning() << "Base path does not exist: " << basePath;
    }

    return result;
}

QVariantList FileLister::listFilesInDirectory(const QDir &directory) {
    QVariantList fileList;
    QStringList files = directory.entryList(QDir::Files);
    for (const QString &fileName : files) {
        fileList.append(fileName);
    }
    return fileList;
}
