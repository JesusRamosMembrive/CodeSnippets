/*****************************************************************************
 * markdownprocessor.h
 * Copyright (C) Overture Life, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Jesus Ramos Membrive <jesusramos@overture.life>
 * Created: 5/6/2024
 *****************************************************************************/
#pragma once
#include <QObject>
#include <QString>
#include <QTextDocument>
#include <QDebug>

class MarkdownProcessor : public QObject {
    Q_OBJECT
public:
    explicit MarkdownProcessor(QObject *parent = nullptr);
    Q_INVOKABLE QString processMarkdown(const QString &markdownText);

};
