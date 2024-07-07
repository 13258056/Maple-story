#pragma once

#include <QObject>
#include "monsterr.h"

class Bird : public Monsterr
{
    Q_OBJECT
public:
    explicit Bird(QObject *parent = nullptr);

    Q_PROPERTY(QPointF position READ position WRITE setPosition NOTIFY positionChanged FINAL)

    QPointF position() const override;
    void setPosition(const QPointF &value);

    void fireBullet();

signals:
    void bulletfired();

private:
    QPointF m_position;
};
