import QtQuick
import Felgo

EntityBase {
    id: end
    entityType: "end"

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
            dialogs.endDialog.open()
                                  }
      }
    }
}
