import QtQuick
import Felgo

EntityBase{
    id: birdmonster
    entityType: "birdmonster"
    width: 40
    height: 40

    property int health: 50

    MultiResolutionImage {
        source: Qt.resolvedUrl("../assets/part1/image149.png")
        width: 70
        height:70
    }

    function shootbullet() {
            var bulletComponent = Qt.createComponent("Bullet.qml");
            if (bulletComponent) {
                var bullet = bulletComponent.createObject(parent, {
                    "x": x + width,
                    "y": y + height
                });
                if (bullet) {
                    bullet.shootTowards(Qt.point(x + width , y + height));
                } else {
                    console.log("Failed to create bullet");
                }
            } else {
                console.log("Failed to load Bullet.qml");
            }
        }
    Timer{
        id:timer
        repeat: true
        running: true
        interval: 1000
        onTriggered: {
            shootbullet()
        }
    }

//    BoxCollider{
//                    id: collider
//                    anchors.fill: parent
//                    bodyType: Body.Static

//                    fixture.onBeginContact: (other, contactNormal) => {
//                      var otherEntity = other.getBody().target
//                      var fixture = other;
//                      var body = other.getBody();
//                       //var otherEntity = body.target
//                       var collidingType = otherEntity.entityType

////                       if(collidingType === "bullet") {
////                            birdmonster.health -= 30
////                            if(birdmonster.health <= 0){
////                            birdmonster.removeEntity()
////                        }

////                                                    return
////                                                }
//                      if(collidingType === "player") {
//                        console.debug("contact platform begin")
//                        player.contacts++
//                        _player3.contacts++
//                        _player4.contacts++
//                        player.health--
//                        _player3.health--
//                        _player4.health--
//                        console.log(player.health)
//                      }
//                    }

//                    fixture.onEndContact: other => {
//                      var otherEntity = other.getBody().target
//                      if(otherEntity.entityType === "player") {
//                        console.debug("contact platform end")
//                          player.contacts--
//                          _player3.contacts--
//                          _player4.contacts--
//                          player.health--
//                          _player3.health--
//                          _player4.health--
//                          console.log(player.health)
//                      }
//                    }
//                  }
}
