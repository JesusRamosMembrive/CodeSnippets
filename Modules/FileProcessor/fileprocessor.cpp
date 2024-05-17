#include "FileProcessor.h"

FileProcessor::FileProcessor(QObject *parent) : QObject(parent)
{
}

void FileProcessor::processFile(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return;

    QTextStream in(&file);
    QString content = in.readAll();
    file.close();

    // Extraer RESULT y EXPLANATION
    extractSection(content, "---RESULT---", "---EXPLANATION---", m_result);
    extractSection(content, "---EXPLANATION---", "---FILES---", m_explanation);

    qDebug() << "m_result: " << m_result;
    qInfo() << "=======================";
    qDebug() << "m_explanation: " << m_explanation;
    qInfo() << "=======================";

    // Extraer el listado de archivos y su contenido
    QString filesSection;
    extractSection(content, "---FILES---", "---", filesSection);
    qInfo() << "=======================";
    qInfo() << "filesSection: " << filesSection;
    QStringList fileNames = filesSection.split('\n', Qt::SkipEmptyParts);

    m_files.clear();
    m_filesList.clear();

    for (const QString &fileName : fileNames) {
        QString trimmedName = fileName.trimmed();
        QString fileStartTag = "---" + trimmedName + "---";
        QString fileData;
        int fileStartIndex = content.indexOf(fileStartTag) + fileStartTag.length();
        int fileEndIndex = content.indexOf("---", fileStartIndex);
        fileData = content.mid(fileStartIndex, fileEndIndex - fileStartIndex).trimmed();
        m_files[trimmedName] = fileData;
        m_filesList.append(trimmedName);
    }

    // Emitir las señales para actualizar QML
    emit resultChanged();
    emit explanationChanged();
    emit filesChanged();
}

QString FileProcessor::getFileContent(const QString &fileName)
{
    if (m_files.contains(fileName)) {
        emit fileSelected(fileName, m_files[fileName]);
        return m_files[fileName];
    }
    return QString();
}

void FileProcessor::extractSection(const QString &text, const QString &startMarker, const QString &endMarker, QString &section)
{
    int startIndex = text.indexOf(startMarker) + startMarker.length();
    int endIndex = (endMarker.isEmpty()) ? text.length() : text.indexOf(endMarker, startIndex);
    section = text.mid(startIndex, endIndex - startIndex).trimmed();
}
