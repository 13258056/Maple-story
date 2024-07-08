import QtQuick
import Felgo
import QmlBird

EntityBase{
    id: birdmonster
    entityType: "birdmonster"
    width: 85
    height: 100

    MultiResolutionImage {
        source: monster.x < moveRange
                ? Qt.resolvedUrl("../assets/part1/image133.png")
                : Qt.resolvedUrl("../assets/part1/image133_turn.png")
        width: parent.width
        height:parent.height
    }
}
