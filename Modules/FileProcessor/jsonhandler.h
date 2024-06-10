/*****************************************************************************
 * jsonhandler.h
 * Copyright (C) Overture Life, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Jesus Ramos Membrive <jesusramos@overture.life>
 * Created: 10/6/2024
 *****************************************************************************/
#pragma once

#include <QObject>
#include <QJsonObject>
#include <QJsonDocument>
#include <QFile>
#include <QJsonArray>
#include <QVariantMap>
#include <QDebug>

class JsonHandler : public QObject {
    Q_OBJECT

public:
    explicit JsonHandler(QObject *parent = nullptr);

    Q_INVOKABLE QVariantMap readJsonFile(const QString &filePath);
    Q_INVOKABLE bool writeJsonFile(const QString &filePath, const QVariantMap &data);
    Q_INVOKABLE void ensurePathsJsonExists(const QString &filePath);
};
