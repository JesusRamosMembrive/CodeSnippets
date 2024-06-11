#include "fileprocessor.h"

FileProcessor::FileProcessor(QObject *parent) : QObject(parent)
{
}

void FileProcessor::processFile(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    getFileTitle(filePath);

    QTextStream in(&file);
    QString content = in.readAll();
    file.close();

    // Extraer EXPLANATION
    extractSection(content, "<---EXPLANATION--->", "<---", m_explanation);

    // Extraer el listado de archivos y su contenido
    QString filesSection;
    extractSection(content, "<---FILES--->", "<---", filesSection);

    QStringList fileNames = filesSection.split('\n', Qt::SkipEmptyParts);

    m_files.clear();
    m_filesList.clear();

    for (const QString &fileName : fileNames) {
        QString trimmedName = fileName.trimmed();
        QString fileStartTag = "<---" + trimmedName + "--->";
        QString fileData;
        int fileStartIndex = content.indexOf(fileStartTag) + fileStartTag.length();
        int fileEndIndex = content.indexOf("<---", fileStartIndex);
        fileData = content.mid(fileStartIndex, fileEndIndex - fileStartIndex).trimmed();
        m_files[trimmedName] = fileData;
        m_filesList.append(trimmedName);
    }

    // Emitir las señales para actualizar QML
    emit explanationChanged();
    emit filesChanged();
    emit titleChanged();

    // Emitir el contenido de todos los archivos procesados
    for (const QString &fileName : fileNames) {
        QString trimmedName = fileName.trimmed();
        if (m_files.contains(trimmedName)) {
            emit fileSelected(trimmedName, m_files[trimmedName], m_title);
        }
    }
}

QString FileProcessor::getFileContent(const QString &fileName)
{
    if (m_files.contains(fileName)) {
        emit fileSelected(fileName, m_files[fileName], m_title);
        return m_files[fileName];
    }
    return QString();
}

QString FileProcessor::getFileTitle(const QString &fileName)
{
    QStringList metaTitle = fileName.split("/");
    QStringList titleTmp = metaTitle.back().split(".");
    m_title = titleTmp[0];
    return m_title;
}

void FileProcessor::extractSection(const QString &text, const QString &startMarker, const QString &endMarker, QString &section)
{
    int startIndex = text.indexOf(startMarker) + startMarker.length();
    int endIndex = (endMarker.isEmpty()) ? text.length() : text.indexOf(endMarker, startIndex);
    section = text.mid(startIndex, endIndex - startIndex).trimmed();
}
