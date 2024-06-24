import Felgo 4.0
import QtQuick 2.0
//import "Contents.qml"

GameWindow {
    id: gameWindow

    width: 1200
    height: 800
    visible: true
    PhysicsWorld{
        id: physicsWorld
        gravity: Qt.point(0, 25)
        debugDrawVisible: false
        z: 1000
    }
    Contents{
        id:allContents
    }
}
