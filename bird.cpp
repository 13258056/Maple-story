#include "bird.h"
#include <QTimer>

Bird::Bird(QObject *parent)
    : Monsterr{parent}
    , m_position(600, 100)
{
    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &Bird::fireBullet);
    timer->start(1000);
}

QPointF Bird::position() const
{
    return m_position;
}
void Bird::setPosition(const QPointF &value)
{
    if (m_position == value) {
        return;
    }
    m_position = value;
    emit positionChanged();
}

void Bird::fireBullet()
{
    emit bulletfired();
}
