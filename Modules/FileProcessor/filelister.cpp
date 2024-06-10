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

QVariantList FileLister::listFoldersAndFiles(const QString &path) {
    QVariantList result;
    QDir dir(path);

    if (dir.exists()) {
        QStringList folders = dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
        for (const QString &folderName : folders) {
            QVariantMap folderMap;
            folderMap["folderName"] = folderName;

            QDir folderDir(dir.absoluteFilePath(folderName));
            folderMap["files"] = listFilesInDirectory(folderDir);
            qInfo() << "Folder: " << folderName;
            result.append(folderMap);
        }
    }

    return result;
}

QVariantList FileLister::listFilesInDirectory(const QDir &directory) {
    QVariantList fileList;
    QStringList files = directory.entryList(QDir::Files);

    for (const QString &fileName : files) {
        fileList.append(fileName);
        qInfo() << "File: " << fileName;
    }

    return fileList;
}
