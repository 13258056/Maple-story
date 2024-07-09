// bullet.qml
import QtQuick 2.0
import Felgo

EntityBase {
    id: bullet
    entityType: "bullet"
    width: 20
    height: 20

    property var velocity: Qt.point(0, 0)

    MultiResolutionImage {
        source: "../assets/part4/Obj_acc5.img.aquarium.acc.34.0.png"
        width: parent.width
        height: parent.height
    }

    function shootTowards(target) {
            var dx = target.x - x;
            var dy = target.y - y;
            var distance = Math.sqrt(dx * dx + dy * dy);
            velocity = Qt.point(500, 0);
            startMoving();
        }

    Timer {
            id: bulletTimer
            interval: 16
            repeat: true
            running: false
        }

        function startMoving() {
            if (!bulletTimer.running) {
                bulletTimer.running = true;
                bulletTimer.triggered.connect(update);
            }
        }
        function update() {
            x += velocity.x / 60;

        }

    BoxCollider {
        width: bullet.width
        height: bullet.height
        anchors.centerIn: parent

        fixture.onBeginContact: (other, contactNormal) => {
          var fixture = other;
          var body = other.getBody();
          var otherEntity = body.target
          var collidingType = otherEntity.entityType

          if(collidingType === "monster" ||
                  collidingType === "birdmonster") {
              bullet.removeEntity()

              return
          }
       }
    }
}
