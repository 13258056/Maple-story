#include "monsterr.h"
#include <QDebug>
#include <QPointF>
#include <QtMath>
Monsterr::Monsterr(QObject *parent)
    : QObject{parent}
    , m_position(800, 640) //怪物初始位置
{}

QPointF Monsterr::position() const
{
    return m_position;
}

void Monsterr::setPosition(const QPointF &value)
{
    if (m_position == value) {
        return;
    }
    m_position = value;
    emit positionChanged();
}

void Monsterr::updateMonsterPosition(const QPointF &playerPosition, int speed)
{
    QPointF direction = playerPosition - m_position;
    qreal distance = qSqrt(direction.x() * direction.x() + direction.y() * direction.y()); //距离
    if (distance > 0) {
        direction /= distance; //将direction设置为单位向量
    }
    m_position += direction * speed; //位置改变
}
