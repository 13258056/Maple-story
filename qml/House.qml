import Felgo 4.0
import QtQuick 2.0

EntityBase {
  id: house
  entityType: "house"

  signal contact
  /*Image {
      source: "../assets/part4/Obj_acc5.img.aquarium.market.13.0.png"
      width: 228
      height: 206
      x:path08.x+150
      y:path09.y-170
  }*/

  BoxCollider {
    anchors.fill: parent
    collisionTestingOnlyMode: true
    fixture.onBeginContact: (other, contactNormal) => {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
                                    house.contact()
      }

    }
  }
}

