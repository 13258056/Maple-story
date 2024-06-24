import QtQuick 2.0
import Felgo

EntityBase {
  id: player
  entityType: "player"
  width: 85
  height: 100

  property int linearVelocity:0

  MultiResolutionImage {
    source: Qt.resolvedUrl("../assets/image/7126_1900493.png")//角色
    width: parent.width
    height:parent.height
  }

  property int contacts: 0
  state: contacts > 0 ? "walking" : "jumping"
  onStateChanged: console.debug("player.state " + state)

  BoxCollider{
      id:collider
      height: parent.height
      width: parent.width
      anchors.horizontalCenter: parent.horizontalCenter
      bodyType: Body.Dynamic
      fixedRotation: true
      bullet: true
      sleepingAllowed: false
      //force: Qt.point(controller.xAxis*170*32,0)
      onLinearVelocityChanged: {
        if(linearVelocity.x > 100) linearVelocity.x = 100
        if(linearVelocity.x < -100) linearVelocity.x = -100
        }
    }

    function jump(){
        if(player.state=="walking"){
            console.debug("do the jump")
            collider.linearVelocity.y = -100
        }
    }
}
