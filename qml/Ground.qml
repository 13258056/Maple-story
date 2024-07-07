import QtQuick
import Felgo

EntityBase {
    id: ground
    entityType: "ground"

    Repeater{
        model:1
        Rectangle{
            color: "transparent"
            z:100
        }
    }

    BoxCollider {
      anchors.fill: parent
      bodyType: Body.Static
      fixture.onBeginContact: (other, contactNormal) => {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") {
                                      player.contacts++
                                      _player2.contacts++
                                  }
      }
      fixture.onEndContact: other => {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") {
                                    player.contacts--
                                    _player2.contacts--
                                }
      }
    }
}
