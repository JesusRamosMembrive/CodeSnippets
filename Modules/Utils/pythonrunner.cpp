/*
 * Copyright 2024 jesus
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */
// PythonRunner.cpp
#include "PythonRunner.h"
#include <QDebug>

PythonRunner::PythonRunner(QObject *parent) : QObject(parent) {
    process = new QProcess(this);
    connect(process, &QProcess::readyReadStandardOutput, this, &PythonRunner::handleProcessOutput);
    connect(process, &QProcess::readyReadStandardError, this, &PythonRunner::handleProcessError);
}

void PythonRunner::runScript(const QString &scriptPath, const QStringList &arguments) {
    process->setProgram("python");
    process->setArguments(QStringList() << scriptPath << arguments);
    process->start();
    if (!process->waitForStarted()) {
        qWarning() << "Error starting process:" << process->errorString();
        return;
    }
    if (!process->waitForFinished()) {
        qWarning() << "Error running process:" << process->errorString();
        return;
    }
}

void PythonRunner::handleProcessOutput() {
    QString output = process->readAllStandardOutput();
    emit scriptOutput(output);
}

void PythonRunner::handleProcessError() {
    QString error = process->readAllStandardError();
    emit scriptError(error);
}
