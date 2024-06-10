/*****************************************************************************
 * filelister.h
 * Copyright (C) Overture Life, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Jesus Ramos Membrive <jesusramos@overture.life>
 * Created: 9/6/2024
 *****************************************************************************/
#pragma once

#include <QObject>
#include <QDir>
#include <QVariantList>

class FileLister : public QObject
{
    Q_OBJECT
public:
    explicit FileLister(QObject *parent = nullptr);
    Q_INVOKABLE QVariantList listFoldersAndFiles(const QString &path);

private:
    QVariantList listFilesInDirectory(const QDir &directory);
};
