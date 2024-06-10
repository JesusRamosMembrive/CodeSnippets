/*****************************************************************************
 * filelister.cpp
 * Copyright (C) Overture Life, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Jesus Ramos Membrive <jesusramos@overture.life>
 * Created: 9/6/2024
 *****************************************************************************/
#include "filelister.h"

FileLister::FileLister(QObject *parent) : QObject(parent) {}

QVariantMap FileLister::createFilesMap(const QVariantList &topics) {
    QVariantMap result;
    for (const QVariant &topic : topics) {
        QVariantMap topicMap = topic.toMap();
        QString path = topicMap["path"].toString();
        QString label = topicMap["label"].toString();

        QDir dir(path);
        if (dir.exists()) {
            QStringList files = dir.entryList(QDir::Files);
            for (const QString &fileName : files) {
                result[fileName] = QVariantMap{
                    {"path", dir.absoluteFilePath(fileName)},
                    {"label", label}
                };
            }
        }
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
