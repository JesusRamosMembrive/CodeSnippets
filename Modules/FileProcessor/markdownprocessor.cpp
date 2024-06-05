/*****************************************************************************
 * markdownprocessor.cpp
 * Copyright (C) Overture Life, Inc - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Jesus Ramos Membrive <jesusramos@overture.life>
 * Created: 5/6/2024
 *****************************************************************************/
#include "markdownprocessor.h"

MarkdownProcessor::MarkdownProcessor(QObject *parent) : QObject(parent) {}

QString MarkdownProcessor::processMarkdown(const QString &markdownText) {
    const QString markdownCss = R"(
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #ffffff;
        }
        h1 {
            color: #2E8B57;
            border-bottom: 2px solid #2E8B57;
            padding-bottom: 0.5em;
        }
        h2 {
            color: #4682B4;
            border-bottom: 1px solid #4682B4;
            padding-bottom: 0.3em;
        }
        h3 {
            color: #6A5ACD;
        }
        p {
            margin: 1em 0;
        }
        code {
            font-family: "Courier New", monospace;
            background-color: #000000;
            color: #ffffff; /* Texto en blanco */
            border: none; /* Sin borde */
            padding: 0; /* Sin padding */
            border-radius: 3px;
            display: inline-block;
            white-space: pre-wrap; /* Ajusta el contenido */
        }
        pre {
            background-color: #000000;
            color: #ffffff; /* Texto en blanco */
            border: none; /* Sin borde */
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
            margin: 0; /* Sin margen */
            white-space: pre-wrap; /* Ajusta el contenido */
            line-height: 1.2; /* Asegura que el texto esté más cerca */
        }
        ul {
            margin: 1em 0;
            padding: 0 1em;
        }
        ol {
            margin: 1em 0;
            padding: 0 1em;
        }
        blockquote {
            margin: 1em 0;
            padding: 0.5em 1em;
            background-color: #f9f9f9;
            border-left: 10px solid #ccc;
            color: #333;
        }
        a {
            color: #1E90FF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
)";


    QTextDocument document;
    document.setMarkdown(markdownText);
    QString htmlText = document.toHtml();

    // Insertar CSS en el HTML
    int headEndIndex = htmlText.indexOf("</head>");
    if (headEndIndex != -1) {
        htmlText.insert(headEndIndex, markdownCss);
    }

    return htmlText;
}
