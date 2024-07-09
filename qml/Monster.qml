import QtQuick
import Felgo

EntityBase{
    id: monster
    entityType: "monster"
    width: 75
    height: 80

    property int moveRange: 700

    MultiResolutionImage {
        source: Qt.resolvedUrl("../assets/part1/image133.png")
        width: parent.width
        height:parent.height
    }
    BoxCollider{
                    id: collider
                    anchors.fill: parent
                    bodyType: Body.Static

                    fixture.onBeginContact: (other, contactNormal) => {
                      var otherEntity = other.getBody().target
                      if(otherEntity.entityType === "player") {
                        console.debug("contact platform begin")
                        player.contacts++
                        _player3.contacts++
                        _player4.contacts++
                        player.health--
                        _player3.health--
                        _player4.health--
                        console.log(player.health)
                      }
                    }

                    fixture.onEndContact: other => {
                      var otherEntity = other.getBody().target
                      if(otherEntity.entityType === "player") {
                        console.debug("contact platform end")
                          player.contacts--
                          _player3.contacts--
                          _player4.contacts--
                          player.health--
                          _player3.health--
                          _player4.health--
                          console.log(player.health)
                      }
                    }
                  }
    /*SequentialAnimation on x{
        loops: Animation.Infinite
        PropertyAnimation{
            from: 500
            to: moveRange
            duration: 3000
            easing.type:Easing.InOutQuad
        }
*/
//    function takeDamage(amount) {
//           health -= amount;
//           if (health <= 0) {
//               destroy();
//           }
//       }

    /*BoxCollider {
        id:collider0
        width: monster.width
        height: monster.height
        anchors.centerIn: parent

        bodyType: Body.Static
//        fixture.onBeginContact: (other, contactNormal) => {
//          var fixture = other;
//          var body = other.getBody();
//          var otherEntity = body.target
//          var collidingType = otherEntity.entityType
//          if(collidingType === "bullet") {
//              bullet.removeEntity()
//               console.log(monster.health)
//               monster.health -= 10
//               if(monster.health <= 0){
//                     monster.removeEntity()
//                }
//          }
//        }

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
    SequentialAnimation on x{
        loops: Animation.Infinite
        PropertyAnimation{
            from: 500
            to: moveRange
            duration: 3000
            easing.type:Easing.InOutQuad
        }

        PropertyAnimation{
            from: moveRange
            to: 500
            duration: 3000
            easing.type:Easing.InOutQuad
        }
        fixture.onBeginContact: (other, contactNormal) => {
          var fixture = other;
          var body = other.getBody();
          var otherEntity = body.target
          var collidingType = otherEntity.entityType
          if(collidingType === "bullet") {
              bullet.removeEntity()
               console.log(monster.health)
               monster.health -= 10
               if(monster.health <= 0){
                     monster.removeEntity()
                }
          }
        }
    }*/
    SequentialAnimation on x{
       loops: Animation.Infinite
        PropertyAnimation{
            from: 500
            to: moveRange
            duration: 3000
            easing.type:Easing.InOutQuad
        }

        PropertyAnimation{
            from: moveRange
            to: 500
           duration: 3000
           easing.type:Easing.InOutQuad
        }
    }
    }
