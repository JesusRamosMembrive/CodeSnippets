/*****************************************************************************
 * jsonhandler.cpp
 * Copyright (C) Overture Life, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Jesus Ramos Membrive <jesusramos@overture.life>
 * Created: 10/6/2024
 *****************************************************************************/
#include "jsonhandler.h"

JsonHandler::JsonHandler(QObject *parent) : QObject(parent) {}

QVariantMap JsonHandler::readJsonFile(const QString &filePath) {
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning("Couldn't open the file.");
        return QVariantMap();
    }

    QByteArray fileData = file.readAll();
    QJsonDocument jsonDoc(QJsonDocument::fromJson(fileData));

    if (jsonDoc.isNull()) {
        qWarning("Failed to create JSON doc.");
        return QVariantMap();
    }
    if (!jsonDoc.isObject()) {
        qWarning("JSON is not an object.");
        return QVariantMap();
    }

    QJsonObject jsonObj = jsonDoc.object();
    return jsonObj.toVariantMap();
}

bool JsonHandler::writeJsonFile(const QString &filePath, const QVariantMap &data) {
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly)) {
        qWarning("Couldn't open the file.");
        return false;
    }

    QJsonObject jsonObj = QJsonObject::fromVariantMap(data);
    QJsonDocument jsonDoc(jsonObj);
    file.write(jsonDoc.toJson());
    file.close();

    return true;
}

void JsonHandler::ensurePathsJsonExists(const QString &filePath) {
    QFile file(filePath);
    if (!file.exists()) {
        QVariantMap defaultData;
        defaultData["c"] = "";
        defaultData["cQt"] = "";
        defaultData["cPatterns"] = "";
        defaultData["python"] = "";
        defaultData["pythonQt"] = "";
        defaultData["patternPython"] = "";

        writeJsonFile(filePath, defaultData);
    }
}
