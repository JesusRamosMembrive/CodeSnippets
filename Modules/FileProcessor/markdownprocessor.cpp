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
    // Insertar CSS directamente en el cuerpo del documento
    const QString markdownCss = R"(
<style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

    body {
        font-family: 'Roboto', sans-serif;
        line-height: 1.6;
        color: #E0E0E0;
        background-color: #121212;
        margin: 0;
        padding: 0 2em;
        overflow-x: hidden;
    }
    h1, h2, h3, h4, h5, h6 {
        font-weight: 500;
        color: #00E5FF;
        margin: 1em 0;
    }
    h1 {
        border-bottom: 2px solid #00E5FF;
        padding-bottom: 0.5em;
    }
    h2 {
        border-bottom: 1px solid #00E5FF;
        padding-bottom: 0.3em;
        font-size: 1.5em;
    }
    h3 {
        font-size: 1.4em;
    }
    p {
        margin: 1em 0;
    }
  code {
            font-family: "Roboto", monospace;
            background-color: #000000;
            color: #ffffff; /* Texto en blanco */
            border: none; /* Sin borde */
            padding: 50px; /* Reduce el padding a 10px */
            display: inline-block;
            max-width: 90%;
            margin: 5px; /* Reduce el margen a 10px */
            align: center;
        }
        pre {
            max-width: 90%;
            background-color: #000000;
            color: #ffffff; /* Texto en blanco */
            border: none; /* Sin borde */
            padding: 5px; /* Reduce el padding a 10px */
            overflow-x: auto;
            margin: 50px; /* Reduce el margen a 10px */
            line-height: 1; /* Ajusta la altura de la línea */
            align: center;
        }
    ul, ol {
        margin: 1em 0;
        padding-left: 1.5em;
    }
    blockquote {
        margin: 1em 0;
        padding: 1em;
        background-color: #1E1E1E;
        border-left: 5px solid #00E5FF;
        color: #E0E0E0;
    }
    a {
        color: #00E5FF;
        text-decoration: none;
        transition: color 0.3s ease;
    }
    a:hover {
        color: #FF4081;
        text-decoration: underline;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 1em 0;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }
    th, td {
        padding: 1em;
        border: 1px solid #333;
        text-align: left;
    }
    th {
        background-color: #00E5FF;
        color: #121212;
        font-size: 1.2em;
    }
    td {
        background-color: #1E1E1E;
        color: #E0E0E0;
    }
    tbody tr:nth-child(even) {
        background-color: #2E2E2E;
    }
    tbody tr:hover {
        background-color: #00E5FF;
        color: #121212;
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
