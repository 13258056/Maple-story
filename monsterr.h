#pragma once

#include <QObject>
#include <QPointF>
#include <QTimer>

class Monsterr : public QObject
{
    Q_OBJECT

public:
    explicit Monsterr(QObject *parent = nullptr);

    Q_PROPERTY(QPointF position READ position WRITE setPosition NOTIFY positionChanged FINAL)

    virtual QPointF position() const;
    void setPosition(const QPointF &value);

    Q_INVOKABLE void updateMonsterPosition(const QPointF &playerPosition, int speed);

signals:
    void positionChanged();

private:
    QPointF m_position;
    QTimer m_time;
};
