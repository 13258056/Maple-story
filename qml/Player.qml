import QtQuick 2.0
import Felgo

EntityBase {
  id: player
  entityType: "player"
  width: 85
  height: 100

  property int health: 100
  property alias collider: collider
  property alias horizontalVelocity: collider.linearVelocity.x

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
      height: 5
      width: 10
      //height: 30
      //width: 30
      anchors.bottom: parent.bottom
      //anchors.left:parent.left
      anchors.horizontalCenter: parent.horizontalCenter
      bodyType: Body.Dynamic
      fixedRotation: true
      bullet: true
      sleepingAllowed: false
      force: Qt.point(controller.xAxis*170*32,0)
      onLinearVelocityChanged: {
        if(linearVelocity.x > 200) linearVelocity.x = 200
        if(linearVelocity.x < -200) linearVelocity.x = -200
        }
      fixture.onBeginContact: (other, contactNormal) => {
        var otherEntity = other.getBody().target
        var fixture = other;
        var body = other.getBody();
        //var otherEntity = body.target
        var collidingType = otherEntity.entityType

        if(collidingType === "bullet") {
            healthFill.width -= 10
            return
           }
        }
    }

  Timer {
    id: updateTimer
    interval: 60
    running: true
    repeat: true
    onTriggered: {
      var xAxis = controller.xAxis;
      if(xAxis == 0) {
        if(Math.abs(player.horizontalVelocity) > 10) player.horizontalVelocity /= 1.5
        else player.horizontalVelocity = 0
      }
    }
  }

    function jump(){
        if(player.state==="walking"){
            console.debug("do the jump")
            collider.linearVelocity.y = -400
        }
    }
    function shoot() {
            var bulletComponent = Qt.createComponent("Bullet.qml");
            if (bulletComponent) {
                var bullet = bulletComponent.createObject(parent, {
                    "x": x + width / 2,
                    "y": y + height / 2
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
