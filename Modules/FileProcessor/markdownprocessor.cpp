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
        body {
            font-family: Roboto, sans-serif;
            line-height: 1.6;
            color: #ffffff;
        }
        h1 {
            color: #2E8B57;
            border-bottom: 2px solid #2E8B57;
            padding-bottom: 1.8em;
        }
        h2 {
            color: #4682B4;
            border-bottom: 1px solid #4682B4;
            font-size: 1.5em;
            margin-bottom: 0.5em;
        }
        h3 {
            color: #6A5ACD;
            font-size: 1.4em;
            margin-bottom: 0.5em;
        }
        p {
            margin: 1em 0;
        }
        code {
            font-family: "Roboto", monospace;
            background-color: #000000;
            color: #ffffff; /* Texto en blanco */
            border: none; /* Sin borde */
            padding: 10px; /* Reduce el padding a 10px */
            display: inline-block;
            max-width: 80%;
            margin: 10px; /* Reduce el margen a 10px */
            align: center;
        }
        pre {
            max-width: 90%;
            background-color: #000000;
            color: #ffffff; /* Texto en blanco */
            border: none; /* Sin borde */
            padding: 10px; /* Reduce el padding a 10px */
            overflow-x: auto;
            margin: 10px; /* Reduce el margen a 10px */
            line-height: 1; /* Ajusta la altura de la línea */
            align: center;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 1em 0;
        }
        th {
            background-color: #04AA6D;
            color: white;
            font-size: 1.2em; /* Tamaño de fuente más grande para los encabezados */
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        td {
            background-color: #00000000;
            color: white;
            border-bottom: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        tbody tr:nth-child(even) {
            background-color: #3a3a3a; /* Alterna el color de fondo para filas pares */
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
