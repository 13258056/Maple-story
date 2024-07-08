import QtQuick
import Felgo

EntityBase{
    id: monster
    entityType: "monster"
    width: 85
    height: 100

    property int moveRange: 700

    MultiResolutionImage {
        source: monster.x < moveRange
                ? Qt.resolvedUrl("../assets/part1/image133.png")
                : Qt.resolvedUrl("../assets/part1/image133_turn.png")
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
                        player.helth--
                        console.log(player.helth)
                      }
                    }

                    fixture.onEndContact: other => {
                      var otherEntity = other.getBody().target
                      if(otherEntity.entityType === "player") {
                        console.debug("contact platform end")
                          player.contacts--
                          player.helth--
                          console.log(player.helth)
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
    }
}
