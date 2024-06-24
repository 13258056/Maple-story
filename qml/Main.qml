import Felgo 4.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    width: 1200
    height: 800
    visible: true
    menuBarFelgoEnabled: false
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
