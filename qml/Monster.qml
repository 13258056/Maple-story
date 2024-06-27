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

    /*
    BoxCollider{
        id:collider
        height: 20
        width: 50
        anchors.bottom: parent.bottom
        //anchors.left:parent.left
        anchors.horizontalCenter: parent.horizontalCenter
        bodyType: Body.Dynamic
        fixedRotation: true
        bullet: true
    }
    */
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
