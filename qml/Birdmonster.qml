import QtQuick
import Felgo
import QmlBird

EntityBase{
    id: birdmonster
    entityType: "birdmonster"
    width: 60
    height: 60

    MultiResolutionImage {
        source: Qt.resolvedUrl("../assets/part1/image149.png")
        width: parent.width
        height:parent.height
    }

    BoxCollider{
        id:collider
        width: birdmonster.width
        height: birdmonster.height
        anchors.centerIn: parent
        bodyType: Body.Static
        fixture.onBeginContact: (other, contactNormal) => {
                              var otherEntity = other.getBody().target
                              if(otherEntity.entityType === "player") {
                                console.debug("contact platform begin")
                                player.contacts++
                                console.log(player.helth)
                                healthFill.width-=20

                              }
                            }

                            fixture.onEndContact: other => {
                              var otherEntity = other.getBody().target
                              if(otherEntity.entityType === "player") {
                                console.debug("contact platform end")
                                  player.contacts--
                                  console.log(player.helth)
                                  healthFill.width-=20
                              }
                            }

    }
    Timer{
        id: shootTimer
        interval: 1000
        repeat: true
        running: true

    }
    function shootbullet() {
            var bulletComponent = Qt.createComponent("Bullet.qml");
            if (bulletComponent) {
                var bullet = bulletComponent.createObject(parent, {
                    "x": x + width / 2,
                    "y": y
                });
                if (bullet) {
                    bullet.shootTowards(Qt.point(x + width / 2, y - height));
                } else {
                    console.log("Failed to create bullet");
                }
            } else {
                console.log("Failed to load Bullet.qml");
            }
        }
}
