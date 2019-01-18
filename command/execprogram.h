#ifndef EXECPROGRAM_H
#define EXECPROGRAM_H

#include <QObject>

class ExecProgram : public QObject
{
    Q_OBJECT
public:
    explicit ExecProgram(QObject *parent = nullptr);

signals:

public slots:
};

#endif // EXECPROGRAM_H