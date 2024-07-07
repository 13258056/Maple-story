import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtMultimedia
import QtQuick3D.Physics
import Felgo
//import "Player" as Player
Item {
    /*游戏的各个关卡界面*/
    property alias choose:_choose
    property alias container:_container
    property alias page0:_page0
    property alias page1:_page1
    property alias page2:_page2
    property alias page3:_page3
    property alias edgePage: _edgePage
    property int sceneWidth:5000
    property int scrollThreshold:900//触发滚动阈值
    property alias background0:background0
    /*初始或结束点的树洞动画*/
    property var images: [
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.0.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.1.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.2.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.3.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.4.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.5.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.6.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.7.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.8.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.9.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.10.png",
        "../assets/part2/Obj_acc2.img.shineWood.gate.0.11.png",
    ]
    property int currentIndex:0//图片索引
//第三关组件
    //黄金旋风
    property var images1: [
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.0.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.1.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.2.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.3.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.4.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.5.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.6.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.7.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.8.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.9.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.10.png",
    "../assets/images/Obj_dungeon.img.metroSubway.acc.20.11.png",
    ]
    property int currentIndex1:0
    //法阵
    property var circle:[
        "../assets/images/Obj_dungeon2.img.toyCastle2.gate.6.0.png",
        "../assets/images/Obj_dungeon2.img.toyCastle2.gate.6.1.png",
        "../assets/images/Obj_dungeon2.img.toyCastle2.gate.6.2.png",
        "../assets/images/Obj_dungeon2.img.toyCastle2.gate.6.0.png",
    ]
    property int  circleIndex: 0
    //星星
    Component{
        id:skylight
        Item{
    property var light: [
    "../assets/images/Obj_acc6.img.folkvillige.nature.24.0.png",
    "../assets/images/Obj_acc6.img.folkvillige.nature.23.1.png",
    ]
    property int lightIndex: 0
            Image {
                id: light0
                source: light[lightIndex]
                width: 33
                height: 29
            }
            Timer{
            id:lightTimer
            interval: 300
            running: true
            repeat: true
            onTriggered: {
                lightIndex=(lightIndex+1)%light.length//循环每张图
                light0.source=light[lightIndex]
            }
            }
        }
    }
    //喷泉
    property var water: [
    "../assets/images/Obj_acc11.img.erebTW.holybird.17.0.png",
    "../assets/images/Obj_acc11.img.erebTW.holybird.17.1.png",
    "../assets/images/Obj_acc11.img.erebTW.holybird.17.2.png",
    ]
    property int waterIndex: 0
    // //火炉
    // property var fire: [
    // "images/Obj_acc3.img.christmas.inside.12.0.png",
    //     "images/Obj_acc3.img.christmas.inside.12.1.png",
    //     "images/Obj_acc3.img.christmas.inside.12.2.png",
    //     "images/Obj_acc3.img.christmas.inside.12.3.png",
    //     "images/Obj_acc3.img.christmas.inside.12.4.png",
    //     "images/Obj_acc3.img.christmas.inside.12.5.png",
    //     "images/Obj_acc3.img.christmas.inside.12.6.png",
    //     "images/Obj_acc3.img.christmas.inside.12.7.png",
    //     "images/Obj_acc3.img.christmas.inside.12.8.png",
    //     "images/Obj_acc3.img.christmas.inside.12.9.png",
    //     "images/Obj_acc3.img.christmas.inside.12.10.png",
    //     "images/Obj_acc3.img.christmas.inside.12.11.png",
    // ]
    // property int fireIndex: 0
    //火
    Component{
    id:fireComponent
    Item{
        property var fire: [
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.0.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.1.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.2.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.4.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.5.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.6.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.7.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.8.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.9.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.10.png",
            "../assets/images/Obj_acc10.img.timeTemplefire.acc.3.11.png",
        ]
        property int fireIndex: 0
        Image {
            id: fire0
            source: fire[fireIndex]
            width: 79
            height:89
        }
        Timer{
        id:fire0Timer
        interval: 200
        running:true
        repeat: true
        onTriggered: {
        fireIndex=(fireIndex+1)%fire.length
            fire0.source=fire[fireIndex]
        }
        }
    }
    }
    //水晶
    Component{
    id:bergComponent
    Item{
        property var berg: [
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.0.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.1.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.2.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.3.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.4.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.5.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.6.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.7.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.8.png",
            "../assets/images/Obj_acc10.img.timeTempleice.acc.0.9.png",
        ]
        property int bergIndex: 0
        Image {
            id: berg0
            source: berg[bergIndex]
            width: 127
            height: 245
        }
        Timer{
        id:bergTimer
        interval: 200
        running:true
        repeat: true
        onTriggered: {
        bergIndex=(bergIndex+1)%berg.length
        berg0.source=berg[bergIndex]
        }
        }
    }
    }
    //火+烟
    Component{
    id:fire1Component
    Item{
        property var fire1: [
            "../assets/images/Obj_acc12.img.aran.fire.0.0.png",
            "../assets/images/Obj_acc12.img.aran.fire.0.1.png",
            "../assets/images/Obj_acc12.img.aran.fire.0.2.png",
            "../assets/images/Obj_acc12.img.aran.fire.0.3.png",
            "../assets/images/Obj_acc12.img.aran.fire.0.4.png",
            "../assets/images/Obj_acc12.img.aran.fire.0.5.png",
        ]
        property int fire1Index: 0
        Image {
            id: fire01
            source: fire1[fire1Index]
            width: 132
            height: 279
        }
        Timer{
        id:fire01Timer
        interval: 200
        running:true
        repeat: true
        onTriggered: {
        fire1Index=(fire1Index+1)%fire1.length
            fire01.source=fire1[fire1Index]
        }
        }
    }
    }
    Component{
    id:cordComponent
    Item{
        property var cord: [
        "../assets/images/Obj_acc11.img.erebTR.trap.3.0.png",
        "../assets/images/Obj_acc11.img.erebTR.trap.3.1.png",
        "../assets/images/Obj_acc11.img.erebTR.trap.3.2.png",
        ]
        property int cordIndex: 0
        Image {
            id: cord1
            source: cord[cordIndex]
            width: 32
            height: 80
        }
        Timer{
        id:cordTimer
        interval: 100
        running:true
        repeat: true
        onTriggered: {
        cordIndex=(cordIndex+1)%cord.length
            cord1.source=cord[cordIndex]
        }
        }
    }
    }
    Component{
     id:firesComponent
     Item{
         property var fires: [
             "../assets/images/Obj_acc12.img.aran.fire.1.0.png",
             "../assets/images/Obj_acc12.img.aran.fire.1.1.png",
             "../assets/images/Obj_acc12.img.aran.fire.1.2.png",
             "../assets/images/Obj_acc12.img.aran.fire.1.3.png",
             "../assets/images/Obj_acc12.img.aran.fire.1.4.png",
             "../assets/images/Obj_acc12.img.aran.fire.1.5.png",
         ]
         property int firesIndex: 0
         Image {
             id: fires0
             source: fires[firesIndex]
             width: 300
             height: 249
         }
         Timer{
         interval: 100
         running: true
         repeat: true
         onTriggered: {
         firesIndex=(firesIndex+1)%fires.length
             fires0.source=fires[firesIndex]
         }
         }
     }
}
    Component{
    id:thunderComponent
    Item{
        property var thunder: [
        "../assets/images/Obj_acc13.img.cityLT.quest.2.0.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.1.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.2.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.3.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.4.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.5.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.6.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.7.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.8.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.9.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.10.png",
        "../assets/images/Obj_acc13.img.cityLT.quest.2.11.png",
        ]
        property int thunderIndex: 0
        Image {
            id: th
            source: thunder[thunderIndex]
            width: 260
            height: 122
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        thunderIndex=(thunderIndex+1)%thunder.length
            th.source=thunder[thunderIndex]
        }
        }
    }
    }
    Component{
    id:fires1Component
    Item{
        property var fires1: [
            "../assets/images/Obj_acc12.img.aran.fire.4.0.png",
            "../assets/images/Obj_acc12.img.aran.fire.4.1.png",
            "../assets/images/Obj_acc12.img.aran.fire.4.2.png",
            "../assets/images/Obj_acc12.img.aran.fire.4.3.png",
            "../assets/images/Obj_acc12.img.aran.fire.4.4.png",
            "../assets/images/Obj_acc12.img.aran.fire.4.5.png",
        ]
        property int fires1Index: 0
        Image {
            id: fi
            source: fires1[fires1Index]
            width: 293
            height: 212
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        fires1Index=(fires1Index+1)%fires1.length
            fi.source=fires1[fires1Index]
        }
        }
    }
    }
    Component{
id:goddessComponent
Item{
    property var god: [
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.0.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.1.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.2.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.3.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.4.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.5.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.6.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.7.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.8.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.9.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.10.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.11.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.12.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.13.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.14.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.15.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.16.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.17.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.18.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.19.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.20.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.21.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.22.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.23.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.24.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.25.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.26.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.27.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.28.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.29.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.30.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.31.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.32.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.33.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.34.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.35.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.36.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.37.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.38.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.39.png",
        "../assets/images/Obj_acc11.img.erebTW.holybird.3.40.png",
    ]
    property int godIndex: 0
    Image {
        id: god0
        source: god[godIndex]
        width: 123
        height: 75
    }
    Timer
    {
    interval: 100
    running: true
    repeat: true
    onTriggered: {
    godIndex=(godIndex+1)%god.length
        god0.source=god[godIndex]
    }
    }
}
}
     //第一关怪物动画
    property var images2:[
        "../assets/part1/image133.png",
        "../assets/part1/image135.png",
        "../assets/part1/image137.png"
    ]
    property int currentIndex2: 0

    property var images3:[
        "../assets/part1/image143.png",
        "../assets/part1/image145.png",
        "../assets/part1/image147.png",
        "../assets/part1/image149.png",
        "../assets/part1/image151.png",
        "../assets/part1/image153.png"
    ]
    property int currentIndex3:0

    Component.onCompleted: {
        rightLeftAnimation.start()
        upDownAnimation.start()
        rightLeftAnimation1.start()
        upDownAnimation1.start()
        path22move.start()
        path30move.start()
        //jellyfloat.start()
            }
    /*关卡1 组件*/
    Component{
        id:_cokeImage
        Item {
            width: 60
            height: 800

            Image {
                id: stand_pink_top
                width: 55
                height: 84
                x:stand_pink_left.x+11
                y:stand_pink_left.y-stand_pink.height*8-stand_pink_top.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.11.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*8
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*7
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.12.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*6
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*5
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*4
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.12.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*3
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height*2
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_left.y-stand_pink.height
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                id: stand_pink_left
                width: 46
                height: 38
                x:stand_pink.x-31
                y:stand_pink.y-stand_pink_left.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.13.0.png"
            }
            Image {
                id: stand_pink
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_right.y-stand_pink.height*4
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_right.y-stand_pink.height*3
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_right.y-stand_pink.height*2
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_right.y-stand_pink.height
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                id: stand_pink_right
                width: 46
                height: 38
                x:stand_pink_bottom.x+4
                y:stand_pink_bottom.y-stand_pink.height*3-stand_pink_right.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.12.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_bottom.y-stand_pink.height*3
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y:stand_pink_bottom.y-stand_pink.height*2
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right.x
                y: stand_pink_bottom.y-stand_pink.height
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                id: stand_pink_bottom
                width:24
                height:38
                x:100
                y:800
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.14.0.png"
            }
        }
    }
    Component{
        id:_cokeImage2
        Item {
            width: 60
            height: 1000
            Image {
                id: stand_green_top
                width: 55
                height: 84
                x:stand_green_left.x-20
                y:stand_green_left.y-stand_green.height*8-stand_green_top.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.15.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_left.y-stand_green.height*8
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_left.y-stand_green.height*7
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_left.y-stand_green.height*6
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x-31
                y:stand_green_left.y-stand_green.height*5
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_left.y-stand_green.height*4
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_left.y-stand_green.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x-31
                y:stand_green_left.y-stand_green.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_left.y-stand_green.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                id: stand_green_left
                width: 46
                height: 38
                x:stand_green.x
                y:stand_green.y-stand_green_left.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                id: stand_green
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_right.y-stand_green.height*4
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_right.y-stand_green.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x-31
                y:stand_green_right.y-stand_green.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_right.y-stand_green.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_right
                width: 46
                height: 38
                x:stand_green_bottom.x+4
                y:stand_green_bottom.y-stand_green.height*3-stand_green_right.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_bottom.y-stand_green.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y:stand_green_bottom.y-stand_green.height*2
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right.x
                y: stand_green_bottom.y-stand_green.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_bottom
                width:24
                height:38
                x:200
                y:800
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.18.0.png"
            }

        }
    }
    Component{
        id:_cokeImage3
        Item {
            width: 60
            height: 1000
            Image {
                id: stand_green_top1
                width: 55
                height: 84
                x:stand_green_left1.x-20
                y:stand_green_left1.y-stand_green1.height*11-stand_green_top1.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.15.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*11
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*10
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*9
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*8
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*7
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*6
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*5
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*4
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x-31
                y:stand_green_left1.y-stand_green1.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_left1.y-stand_green1.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_left1
                width: 46
                height: 38
                x:stand_green1.x
                y:stand_green1.y-stand_green_left1.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                id: stand_green1
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_right1.y-stand_green1.height*4
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_right1.y-stand_green1.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x-31
                y:stand_green_right1.y-stand_green1.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_right1.y-stand_green1.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_right1
                width: 46
                height: 38
                x:stand_green_bottom1.x+4
                y:stand_green_bottom1.y-stand_green1.height*3-stand_green_right1.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_bottom1.y-stand_green1.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y:stand_green_bottom1.y-stand_green1.height*2
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right1.x
                y: stand_green_bottom1.y-stand_green1.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_bottom1
                width:24
                height:38
                x:300
                y:950
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.18.0.png"
            }
        }
    }
    Component{
        id:_cokeImage4
        Item {
            width: 60
            height: 1000
            Image {
                id: stand_pink_top1
                width: 55
                height: 84
                x:stand_pink_left1.x+11
                y:stand_pink_left1.y-stand_pink1.height*15-stand_pink_top1.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.11.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*15
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.12.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x-31
                y:stand_pink_left1.y-stand_pink1.height*14
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.13.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*13
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*12
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x-31
                y:stand_pink_left1.y-stand_pink1.height*11
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.13.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*10
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*9
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*8
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*7
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*6
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*5
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*4
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.12.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*3
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height*2
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_left1.y-stand_pink1.height
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                id: stand_pink_left1
                width: 46
                height: 38
                x:stand_pink1.x-31
                y:stand_pink1.y-stand_pink_left1.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.13.0.png"
            }
            Image {
                id: stand_pink1
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_right1.y-stand_pink1.height*4
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_right1.y-stand_pink1.height*3
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_right1.y-stand_pink1.height*2
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_right1.y-stand_pink1.height
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                id: stand_pink_right1
                width: 46
                height: 38
                x:stand_pink_bottom1.x+4
                y:stand_pink_bottom1.y-stand_pink1.height*3-stand_pink_right1.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.12.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_bottom1.y-stand_pink1.height*3
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y:stand_pink_bottom1.y-stand_pink1.height*2
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_pink_right1.x
                y: stand_pink_bottom1.y-stand_pink1.height
                source: "../assets/part1/stand_pink.png"
            }
            Image {
                id: stand_pink_bottom1
                width:24
                height:38
                x:400
                y:1000
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.14.0.png"
            }
        }
    }
    Component{
        id:_cokeImage5
        Item {
            width: 60
            height: 1000
            Image {
                id: stand_green_top2
                width: 55
                height: 84
                x:stand_green_left2.x-20
                y:stand_green_left2.y-stand_green2.height*11-stand_green_top2.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.15.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*11
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x-31
                y:stand_green_left2.y-stand_green2.height*10
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*9
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*8
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*7
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*6
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*5
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*4
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x-31
                y:stand_green_left2.y-stand_green2.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_left2.y-stand_green2.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_left2
                width: 46
                height: 38
                x:stand_green2.x
                y:stand_green2.y-stand_green_left2.height
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                id: stand_green2
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_right2.y-stand_green2.height*4
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_right2.y-stand_green2.height*3
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x-31
                y:stand_green_right2.y-stand_green2.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_right2.y-stand_green2.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_right2
                width: 46
                height: 38
                x:stand_green_bottom2.x+4
                y:stand_green_bottom2.y-stand_green2.height*3-stand_green_right2.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x-31
                y:stand_green_bottom2.y-stand_green2.height*3
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.16.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y:stand_green_bottom2.y-stand_green2.height*2
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.17.0.png"
            }
            Image {
                width: 46
                height: 38
                x:stand_green_right2.x
                y: stand_green_bottom2.y-stand_green2.height
                source: "../assets/part1/stand_green.png"
            }
            Image {
                id: stand_green_bottom2
                width:24
                height:38
                x:500
                y:800
                source: "../assets/part1/Obj_acc4.img.toyCastle.pet.18.0.png"
            }

        }
    }
    //关卡4
    Component{
        id:whaleComponent
        Item{
            property var whale: [
            "../assets/part4/Obj_acc12.img.rienTW.ship.16.0.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.1.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.2.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.3.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.4.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.5.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.6.png",
                "../assets/part4/Obj_acc12.img.rienTW.ship.16.7.png",
            ]
            property int whaleIndex: 0
            Image {
                id: whale0
                source: whaleIndex
                width: 601*1.5
                height: 135*1.5
            }
            Timer
            {
            interval: 200
            running: true
            repeat: true
            onTriggered: {
            whaleIndex=(whaleIndex+1)%whale.length
                whale0.source=whale[whaleIndex]
            }
            }
        }
        }
    Component{
        id:magicComponent
        Item{
            property var magic: [
            "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.0.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.1.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.2.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.3.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.4.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.5.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.6.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.7.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.8.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.9.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.10.png",
                "../assets/part4/Obj_dungeon3.img.woodCave.wood.1.11.png",
            ]
            property int magicIndex: 0
            Image {
                id: magic0
                source: magicIndex
                width: 177*1.8
                height: 203*2.5
            }
            Timer
            {
            interval: 100
            running: true
            repeat: true
            onTriggered: {
            magicIndex=(magicIndex+1)%magic.length
                magic0.source=magic[magicIndex]
            }
            }
        }
        }
    Component{
    id:lightComponent
    Item{
        property var shine: [
        "../assets/part4/Obj_acc10.img.elinField.light.0.0.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.1.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.2.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.3.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.4.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.5.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.6.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.7.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.8.png",
            "../assets/part4/Obj_acc10.img.elinField.light.0.9.png",
        ]
        property int shineIndex: 0
        Image {
            id: shine0
            source: shineIndex
            width: 141*1.3
            height: 204*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        shineIndex=(shineIndex+1)%shine.length
            shine0.source=shine[shineIndex]
        }
        }
    }
    }
    Component{
    id:lightComponent1
    Item{
        property var shine1: [
        "../assets/part4/Obj_acc10.img.elinField.light.1.0.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.1.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.2.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.3.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.4.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.5.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.6.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.7.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.8.png",
            "../assets/part4/Obj_acc10.img.elinField.light.1.9.png",
        ]
        property int shine1Index: 0
        Image {
            id: shine01
            source: shine1Index
            width: 131*1.3
            height: 118*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        shine1Index=(shine1Index+1)%shine1.length
            shine01.source=shine1[shine1Index]
        }
        }
    }
    }
    Component{
    id:lightComponent2
    Item{
        property var shine2: [
        "../assets/part4/Obj_acc10.img.elinField.light.2.0.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.1.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.2.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.3.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.4.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.5.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.6.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.7.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.8.png",
            "../assets/part4/Obj_acc10.img.elinField.light.2.9.png",
        ]
        property int shine2Index: 0
        Image {
            id: shine02
            source: shine2Index
            width: 48*1.8
            height: 108*2
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        shine2Index=(shine2Index+1)%shine2.length
            shine02.source=shine2[shine2Index]
        }
        }
    }
    }
    Component{
    id:jellyComponent
    Item{
        property var jelly: [
        "../assets/part4/Obj_acc5.img.aquaRoad.fish.0.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.0.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.0.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.0.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.0.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.0.5.png",
        ]
        property int jellyIndex: 0
        Image {
            id: jelly0
            source: jellyIndex
            width: 25*1.3
            height: 33*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        jellyIndex=(jellyIndex+1)%jelly.length
            jelly0.source=jelly[jellyIndex]
        }
        }
        NumberAnimation {
           id:jellyfloat
           target: jelly0
           property: "y"
           duration: 22000
           running:true
           from: 700
           to:0
           easing.type: Easing.InOutQuad
           onFinished: bluejellyfloat.start()

        }
    }
    }
    Component{
    id:bluejellyComponent
    Item{
        property var bluejelly: [
        "../assets/part4/Obj_acc5.img.aquaRoad.fish.1.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.1.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.1.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.1.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.1.5.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.1.6.png",
        ]
        property int bluejellyIndex: 0
        Image {
            id: bluejelly0
            source: bluejellyIndex
            width: 25*1.3
            height: 33*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        bluejellyIndex=(bluejellyIndex+1)%bluejelly.length
            bluejelly0.source=bluejelly[bluejellyIndex]
        }
        }
        NumberAnimation {
           id:bluejellyfloat
           target: bluejelly0
           property: "y"
           duration: 22000
           running:true
           from: 700
           to:0
           easing.type: Easing.InOutQuad
           onFinished: redjellyfloat.start()

        }
    }
    }
    Component{
    id:redjellyComponent
    Item{
        property var redjelly: [
        "../assets/part4/Obj_acc5.img.aquaRoad.fish.2.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.2.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.2.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.2.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.2.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.2.5.png",
        ]
        property int redjellyIndex: 0
        Image {
            id: redjelly0
            source: redjellyIndex
            width: 44*1.3
            height: 26*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        redjellyIndex=(redjellyIndex+1)%redjelly.length
            redjelly0.source=redjelly[redjellyIndex]
        }
        }
        NumberAnimation {
           id:redjellyfloat
           target: redjelly0
           property: "y"
           duration: 22000
           running:true
           from: 700
           to:0
           easing.type: Easing.InOutQuad
           onFinished: perplejellyfloat.start()

        }
    }
    }
    Component{
    id:perplejellyComponent
    Item{
        property var perplejelly: [
        "../assets/part4/Obj_acc5.img.aquaRoad.fish.3.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.3.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.3.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.3.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.3.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.3.5.png",
        ]
        property int perplejellyIndex: 0
        Image {
            id: perplejelly0
            source: perplejellyIndex
            width: 44*1.3
            height: 26*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        perplejellyIndex=(perplejellyIndex+1)%perplejelly.length
            perplejelly0.source=perplejelly[perplejellyIndex]
        }
        }
        NumberAnimation {
           id:perplejellyfloat
           target: perplejelly0
           property: "y"
           duration: 22000
           running:true
           from: 700
           to:0
           easing.type: Easing.InOutQuad
           onFinished: jellyfloat.start()

        }
    }
    }
    Component{
    id:bluehorseComponent
    Item{
        property var bluehorse: [
        "../assets/part4/Obj_acc5.img.aquaRoad.fish.4.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.4.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.4.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.4.3.png",
        ]
        property int bluehorseIndex: 0
        Image {
            id: bluehorse0
            source: bluehorseIndex
            width: 35*1.3
            height: 34*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        bluehorseIndex=(bluehorseIndex+1)%bluehorse.length
            bluehorse0.source=bluehorse[bluehorseIndex]
        }
        }
       /* NumberAnimation {
           id:bluehousemove
           target: bluehorse0
           property: "x"
           duration: 12000
           running:true
           from: 700
           to:0
           easing.type: Easing.InOutQuad
           onFinished: bluehousemove_return.start()

        }*/
    }
    }
    Component{
    id:redhorseComponent
    Item{
        property var redhorse: [
        "../assets/part4/Obj_acc5.img.aquaRoad.fish.5.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.5.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.5.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.5.3.png",
        ]
        property int redhorseIndex: 0
        Image {
            id: redhorse0
            source: redhorseIndex
            width: 35*1.3
            height: 34*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        redhorseIndex=(redhorseIndex+1)%redhorse.length
            redhorse0.source=redhorse[redhorseIndex]
        }
        }

    }
    }
    Component{
    id:horseComponent
    Item{
        property var horse: [

            "../assets/part4/Obj_acc5.img.aquaRoad.fish.6.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.6.2.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.fish.6.3.png",
        ]
        property int horseIndex: 0
        Image {
            id: horse0
            source: horseIndex
            width: 35*1.3
            height: 34*1.5
        }
        Timer
        {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        horseIndex=(horseIndex+1)%horse.length
            horse0.source=horse[horseIndex]
        }
        }

    }
    }
    Component{
    id:airComponent
    Item{
        property var air: [
        "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.0.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.0.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.0.5.png",
        ]
        property int airIndex: 0
        Image {
            id: air0
            source: air[airIndex]
            width: 8*2
            height:14*2
        }
        Timer{
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        airIndex=(airIndex+1)%air.length
            air0.source=air[airIndex]
        }
        }
    }
    }
    Component{
    id:airComponent1
    Item{
        property var air1: [
        "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.1.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.1.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.1.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.1.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.1.5.png",
        ]
        property int air1Index: 0
        Image {
            id: air01
            source: air1[air1Index]
            width: 22*2
            height:35*2
        }
        Timer{
        interval: 100
        running: true
        repeat: true
        onTriggered: {
        air1Index=(air1Index+1)%air1.length
            air01.source=air1[air1Index]
        }
        }
    }
    }
    Component{
    id:airComponent2
    Item{
        property var air2: [
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.2.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.2.1.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.2.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.2.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.2.5.png",
        ]
        property int air2Index: 0
        Image {
            id: air02
            source: air2[air2Index]
            width: 29*2
            height:52*1.5
        }
        Timer{
        interval: 300
        running: true
        repeat: true
        onTriggered: {
        air2Index=(air2Index+1)%air2.length
            air02.source=air2[air2Index]
        }
        }
    }
    }
    Component{
    id:airComponent3
    Item{
        property var air3: [
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.3.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.3.1.png",
        "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.3.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.3.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.3.5.png",
        ]
        property int air3Index: 0
        Image {
            id: air03
            source: air3[air3Index]
            width: 61*1.5
            height:230*1.5
        }
        Timer{
        interval: 200
        running: true
        repeat: true
        onTriggered: {
        air3Index=(air3Index+1)%air3.length
            air03.source=air3[air3Index]
        }
        }
    }
    }
    Component{
    id:airComponent4
    Item{
        property var air4: [
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.4.0.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.4.1.png",
        "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.4.3.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.4.4.png",
            "../assets/part4/Obj_acc5.img.aquaRoad.waterdrop.4.5.png",
        ]
        property int air4Index: 0
        Image {
            id: air04
            source: air4[air4Index]
            width: 13*1.5
            height:18*1.5
        }
        Timer{
        interval: 250
        running: true
        repeat: true
        onTriggered: {
        air4Index=(air4Index+1)%air4.length
            air04.source=air4[air4Index]
        }
        }
    }
    }
    Component{
    id:fishConponent
    Item{property var fish: [
        "../assets/part4/Obj_acc9.img.inside.power.7.0.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.1.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.2.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.3.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.4.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.5.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.6.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.7.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.8.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.9.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.10.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.11.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.12.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.13.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.14.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.15.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.16.png",
            "../assets/part4/Obj_acc9.img.inside.power.7.17.png",
        ]
        property int fishIndex: 0
        Image {
            id: fish0
            source: fish[fishIndex]
            width: 349
            height: 226
        }
        Timer{
        interval: 150
        running: true
        repeat: true
        onTriggered: {
        fishIndex=(fishIndex+1)%fish.length
            fish0.source=fish[fishIndex]
        }
        }
    }
    }
    Component{
    id:airsComponent
    Item{property var airs: [
        "../assets/part4/Obj_acc9.img.inside.power.8.0.png",
            "../assets/part4/Obj_acc9.img.inside.power.8.1.png",
            "../assets/part4/Obj_acc9.img.inside.power.8.2.png",
            "../assets/part4/Obj_acc9.img.inside.power.8.3.png",
            "../assets/part4/Obj_acc9.img.inside.power.8.4.png",
            "../assets/part4/Obj_acc9.img.inside.power.8.5.png",
        ]
        property int airsIndex: 0
        Image {
            id: airs0
            source: airs[airsIndex]
            width: 470
            height: 210
        }
        Timer{
        interval: 300
        running: true
        repeat: true
        onTriggered: {
        airsIndex=(airsIndex+1)%airs.length
            airs0.source=airs[airsIndex]
        }
        }
    }
    }
    Component{
    id:preciousComponent
    Item{
        property var precious: [
        "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.0.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.1.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.2.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.3.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.4.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.5.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.6.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.7.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.8.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.9.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.10.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.11.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.12.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.13.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.14.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.15.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.16.png",
            "../assets/part4/Obj_dungeon3.img.woodCave.gate.0.17.png",
        ]
        property int preciousIndex: 0
        Image {
            id: precious0
            source: precious[preciousIndex]
            width: 624
            height: 379
        }
        Timer{
        interval: 200
        running: true
        repeat: true
        onTriggered: {
        preciousIndex=(preciousIndex+1)%precious.length
            precious0.source=precious[preciousIndex]
        }
        }
    }
    }
    Component{
    id:bronzeComponent
    Item{
        property var bronze: [
        "../assets/part4Obj_dungeon3.img.woodCave.gate.2.0.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.1.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.2.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.3.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.4.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.5.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.6.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.7.png",
            "../assets/part4Obj_dungeon3.img.woodCave.gate.2.8.png",
        ]
        property int bronzeIndex: 0
        Image {
            id: bronze0
            source: bronze[bronzeIndex]
            width: 167
            height: 162
        }
        Timer{
        interval: 100
        running:true
        repeat: true
        onTriggered: {
        bronzeIndex=(bronzeIndex+1)%bronze.length
            bronze0.source=bronze[bronzeIndex]
        }
        }
    }
    }
    /*关卡选择界面*/
    Page{
        id:_choose
        height: 800
        width:1200
        visible: false
        Rectangle{
            width: 1200
            height: 800
            Image {
                id:_image
                height: 800
                width: 683
                x:0
                source: "../assets/image/back.14.png"
            }
            Image {
                height: 153*2
                width: 159*2
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                source: "../assets/image/tree1.PNG"
            }


            Rectangle {
                id: _container
                /*进行关卡图片的创建*/
                Text{
                    width: 200
                    height: 200
                    text: qsTr("请进行关卡选择")
                    color:"black"
                    font.pointSize: 36
                    x:_image.width+50
                    y:50
                    z:1
                }

                Component{
                    id:delegate_guanqia
                    Rectangle{
                        id:_guanqia
                        width: 200
                        height: 200
                        radius: 10

                        anchors.margins: 20

                        TapHandler
                        {
                            onTapped:{
                                backgroundMusic.pause()
                                // text_guanqia.color="#a89a9a"
                                numImage.source="../assets/image/changenum" + index + ".png"
                                console.log("进入关卡【"+index+"】")
                                if(index==0){
                                    _page0.visible=true
                                    _page1.visible=false
                                    _page2.visible=false
                                    _page3.visible=false
                                    backgroundMusic.source=Qt.resolvedUrl("../assets/music/Bgm01.img.BadGuys.mp3")
                                    backgroundMusic.play()
                                }
                                if(index==1){
                                    _page1.visible=true
                                    _page0.visible=false
                                    _page2.visible=false
                                    _page3.visible=false
                                    backgroundMusic.source=Qt.resolvedUrl("../assets/music/Bgm01.img.HighlandStar.mp3")
                                    backgroundMusic.play()
                                }
                                if(index==2){
                                    _page2.visible=true
                                    _page1.visible=false
                                    _page0.visible=false
                                    _page3.visible=false
                                    backgroundMusic.source=Qt.resolvedUrl("../assets/music/Bgm00.img.SleepyWood.mp3")
                                    backgroundMusic.play()
                                }
                                if(index==3){
                                    _page3.visible=true
                                    _page1.visible=false
                                    _page2.visible=false
                                    _page0.visible=false
                                    backgroundMusic.source=Qt.resolvedUrl("../assets/music/Bgm01.img.MoonlightShadow.mp3")
                                    backgroundMusic.play()
                                }
                                console.log("切换到页面【"+index+"】")
                                _container.visible=false
                                _edgePage.visible=true
                            }
                        }
                        Image {
                            id: numImage
                            width: 44
                            height: 46
                            source: "../assets/image/num" + index + ".png"
                            anchors.centerIn: parent
                        }

                        Image {
                            id: iconImage
                            width: 75
                            height:75
                            source: "../assets/image/cake" + index + ".gif" // 动态设置图像源
                            fillMode: Image.PreserveAspectFit
                                }

                    }
                }
                GridView {
                    id:_num_guanqia
                    width: 500
                    height: 500
                    cellWidth: 200
                    cellHeight: 200
                    x:_image.width+50
                    y:200
                    model: 4
                    delegate: delegate_guanqia
                }

            }
        }
    }

    Keys.forwardTo: controller
                TwoAxisController {
                  id: controller
                  inputActionsToKeyCode: {
                      "up":Qt.Key_K,
                      "left":Qt.Key_A,
                      "right":Qt.Key_D,
                      "fire":Qt.Key_J
                  }

                  onInputActionPressed: (actionName, isPressed) => {
                    console.debug("key pressed actionName " + actionName)
                    if(actionName === "up") {
                      player.jump()
                                                _player2.jump()
                    }
                    if(actionName==="left"){
                      controller.xAxis=-1;
                    }
                    if(actionName==="right"){
                    controller.xAxis=1;
                    }
                  }
                }

    /*关卡1*/
    Page{
        id:_page0
        visible: false

        Player{
            id:player
            x:66
            y:300
            z:100
        }

        /*重新游戏*/
        Button{
            width:120
            height:40
            text:"重新游戏"
            x:90
            y:750
            z:50

            onClicked: {
            /*将当前页面关卡重置*/
                player.x=66
                player.y=300
            }
        }

        focus:true

        EntityManager {
          id: entityManager
        }


        Rectangle{
            id:gameScene
            width: 1200
            height: 800
            Monster{
                id:monster
                x:700
                y:500
                z:1
            }
            Level1{
                id:level
            }


            ResetSensor{
                width: player.width
                height: 10
                x: player.x
                anchors.bottom: parent.bottom
                onContact: {
                  player.x = 60
                  player.y = 300
                }
                Rectangle {
                  anchors.fill: parent
                  color: "yellow"
                  opacity: 0.5
                }
            }


            /*背景图片*/
            Image {
                id: background0
                height:800
                width:2258
                x:0
                source: "../assets/part1/background3.png"


                Loader{
                    sourceComponent: _cokeImage
                    x:500
                    y:-50
                }
                Loader{
                    sourceComponent: _cokeImage
                    x:0
                    y:0
                }
                Loader{
                    sourceComponent: _cokeImage2
                    x:0
                    y:0
                }
                Loader{
                    sourceComponent: _cokeImage3
                    x:0
                    y:0
                }
                Loader{
                    sourceComponent: _cokeImage4
                    x:0
                    y:0
                }
                Loader{
                    sourceComponent: _cokeImage5
                    x:0
                    y:0
                }
                Loader{
                    sourceComponent: _cokeImage5
                    x:200
                    y:300
                }
                Loader{
                    sourceComponent: _cokeImage2
                    x:600
                    y:0
                }
                Loader{
                    sourceComponent: _cokeImage4
                    x:500
                    y:400
                }
                Loader{
                    sourceComponent: _cokeImage2
                    x:800
                    y:200
                }

                Image {
                    id: _npc2
                    source: images3[currentIndex3]
                    width: 57
                    height:52
                    x:600
                    y:400
                }
                Timer{
                    interval: 200
                    running:true
                    repeat: true
                    onTriggered: {
                        currentIndex3=(currentIndex3+1)%images3.length//循环每张图
                        _npc2.source=images3[currentIndex3]
                    }
                }

                Image {
                    id: _end
                    source: images1[currentIndex1]
                    width: 100
                    height:100
                    x:1100
                    y:450
                }
                Timer{
                    interval: 200
                    running:true
                    repeat: true
                    onTriggered: {
                        currentIndex1=(currentIndex1+1)%images1.length//循环每张图
                        _end.source=images1[currentIndex1]
                    }
                }
            }
        }

    }
    /*关卡2*/
    Page{
        id:_page1
        visible: false

        /*重新游戏*/
        Button{
            width:120
            height:40
            text:"重新游戏"
            x:90
            y:750
            z:50

            onClicked: {
            /*将当前页面关卡重置*/
                _player2.x = 60
                _player2.y = 300
                  background1.x=0
                  background1.y=0
            }
        }

        Rectangle{
            id:gameScene1
            width: 1200
            height: 800

            Level2{
                id:level2
            }

            Player{
                id:_player2
                x:66
                y:300
                z:1

                onXChanged: {
                    // 如果角色到达场景边缘的阈值
                    if (_player2.x + _player2.width >scrollThreshold &&background1.x>-background1.width*3) {
                        // 移动场景内容（背景和角色）
                        var scrollDistance = _player2.x + _player2.width - scrollThreshold;
                        background1.x -= scrollDistance;
                        _player2.x=scrollThreshold-_player2.width
                    }
                    console.log("x:"+x+",y:"+y)
                }
            }

            focus:true
            ResetSensor{
                width: _player2.width
                height: 10
                x: _player2.x
                anchors.bottom: parent.bottom
                onContact: {
                  _player2.x = 60
                  _player2.y = 300
                    background1.x=0
                    background1.y=0
                }
                Rectangle {
                  anchors.fill: parent
                  color: "yellow"
                  opacity: 0.5
                }
            }

            Image {
                id: background1
                width:1200
                height: 900
                source: "../assets/part2/Obj_acc1.img.lv200.magician.0.0.png"
                fillMode: Image.PreserveAspectCrop

                /*延长背景图背景图*/
                Image {
                    id: background1B
                    x:parent.width
                    width:1200
                    height: 900
                    source: "../assets/part2/Obj_acc1.img.lv200.magician.0.0.png"
                }
                Image {
                    id: background1C
                    x:2400
                    width:1200
                    height: 900
                    source: "../assets/part2/Obj_acc1.img.lv200.magician.0.0.png"
                }
                Image {
                    id: background1D
                    x:3600
                    width:1200
                    height: 900
                    source: "../assets/part2/Obj_acc1.img.lv200.magician.0.0.png"
                }

                /*树洞的动画*/
                Image {
                    id: tree
                    source: images[currentIndex]
                    width: 344*1.5
                    height: 321*1.5
                    x:10
                    y:0
                }
                Timer{
                    id:treeTimer
                    interval: 100
                    running: true
                    repeat: true
                    onTriggered: {
                        currentIndex=(currentIndex+1)%images.length//循环每张图
                        tree.source=images[currentIndex]
                    }
                }

                /*地面*/
                Image {
                    id:_ground
                    x:0
                    y:tree.height-25
                    width:850
                    height: 150*3
                    fillMode: Image.PreserveAspectCrop
                    source: "../assets/part2/Obj_acc1.img.lv200.archer.2.0.png"                    
                }

                /*下吊桥*/
                Image{
                    id:_bridge
                    x:_ground.width-100
                    y:tree.height-50
                    width:403*2
                    height:227*2
                    source:"../assets/part2/Obj_acc2.img.shineWood.foot.23.0.png"
                }

                /*小平台*/
                Image {
                    id: _stand
                    x:_bridge.x+_bridge.width+100
                    y:_bridge.y+300
                    width: 64*2
                    height:37*2
                    source: "../assets/part2/image456.png"
                }
                Image {
                    id:_stand1
                    x:_stand.x+_stand.width+100
                    y:_stand.y
                    width: 64*2
                    height:37*2
                    source: "../assets/part2/image456.png"
                }
                Image {
                    id:_stand2
                    x:_stand1.x+_stand1.width+75
                    y:_stand.y-100
                    width: 119*2
                    height:83*2
                    z:1
                    source: "../assets/part2/Obj_acc2.img.common.foothold.2.0.png"
                }

                /*连接*/
                Image{
                    id:_bridge1
                    y:_stand2.y-100
                    x:_stand2.x
                    width: 367*2
                    height: 127*2
                    source: "../assets/part2/Obj_acc2.img.shineWood.foot.26.0.png"
                }
                /*横向移动*/
                Image {
                    id: _stand3
                    width: 200
                    height: 20
                    source: "../assets/part2/Obj_acc1.img.lv200.archer.2.0.png"
                    x:_bridge1.x+_bridge1.width+50
                    y:_bridge1.y-40

                }
                NumberAnimation {
                            id: rightLeftAnimation
                            target: _stand3
                            properties: "x"
                            to: _stand3.x + 400
                            duration: 2000
                            easing.type: Easing.InOutQuad
                            onFinished: rightLeftAnimation_return.start()
                        }
                NumberAnimation {
                            id: rightLeftAnimation_return
                            target: _stand3
                            properties: "x"
                            to: _stand3.x - 400
                            duration: 2000
                            easing.type: Easing.InOutQuad
                            onFinished:rightLeftAnimation.start()
                        }

                /*竖直移动*/
                Image {
                    id: _stand4
                    width: 200
                    height: 20
                    source: "../assets/part2/Obj_acc1.img.lv200.archer.2.0.png"
                    x:_bridge1.x+_bridge1.width+_stand3.width+450
                    y:_stand3.y-200
                }
                NumberAnimation {
                            id: upDownAnimation
                            target: _stand4
                            properties: "y"
                            to: _stand4.y + 400
                            duration: 2000
                            easing.type: Easing.InOutQuad
                            onFinished: upDownAnimation_return.start()
                        }
                NumberAnimation {
                            id: upDownAnimation_return
                            target: _stand4
                            properties: "y"
                            to: _stand4.y - 400
                            duration: 2000
                            easing.type: Easing.InOutQuad
                            onFinished:upDownAnimation.start()
                        }
            }


        }

    }
    /*关卡3*/
    Page{
        id:_page2
        visible: false
        Rectangle{
            id:gameScene2
            width: 1200
            height: 800
            /*BackgroundMusic{
                    id: _backgroundmusic3
                    volume: 0.5 // 音量设置为50%
                    source: Qt.resolvedUrl("../assets/music/Bgm00.img.SleepyWood.mp3") // 使用本地资源
                    loops: SoundEffect.Infinite // 无限循环播放
                    playing:false
                }
            Component.onCompleted:_backgroundmusic3.pause()*/
            Image {
                id: background2
                width: parent.width
                height: parent.height
                source: "../assets/images/sky1.jpg"
                fillMode: Image.PreserveAspectCrop
                Image {
                    id: background2B
                    x:parent.width
                    width:1300
                    height: 900
                    source: "../assets/images/sky1.jpg"
                    Image {
                        id: cloud0
                        source: "../assets/images/cloud.png"
                        width: background2B.width
                        height: background2.height
                        opacity: 0.7
                        fillMode: Image.PreserveAspectCrop
                    }
                    Image {
                        id: clouds
                        source: "../assets/images/clouds.png"
                        width: 1200
                        height: 640
                        y:-200
                    }
                }
                Image {
                    id: background2C
                    x:parent.width*2
                    width:1300
                    height: 900
                    source: "../assets/images/sky1.jpg"
                    Image {
                        id: cloud1
                        source: "../assets/images/cloud.png"
                        width: background2B.width
                        height: background2.height
                        opacity: 0.7
                        fillMode: Image.PreserveAspectCrop
                    }
                    Image {
                        id: clouds1
                        source: "../assets/images/clouds.png"
                        width: 1200
                        height: 640
                        y:-200
                    }
                }
                Image {
                    id: background2D
                    x:parent.width*3
                    width:1300
                    height: 900
                    source: "../assets/images/sky3.jpg"
                    Image {
                        id: cloud2
                        source: "../assets/images/cloud.png"
                        width: background2B.width
                        height: background2.height
                        opacity: 0.7
                        fillMode: Image.PreserveAspectCrop
                    }
                    Image {
                        id: clouds2
                        source: "../assets/images/clouds2.png"
                        width: 1200
                        height: 640
                        y:-200
                    }
                }
                Image {
                    id: background2E
                    x:background2D.x+background2D.width
                    width:1300
                    height: 900
                    source: "../assets/images/sky3.jpg"
                    Image {
                        id: cloud3
                        source: "../assets/images/cloud.png"
                        width: background2B.width
                        height: background2.height
                        opacity: 0.7
                        fillMode: Image.PreserveAspectCrop
                    }
                    Image {
                        id: clouds3
                        source: "../assets/images/clouds2.png"
                        width: 1200
                        height: 640
                        y:-200
                    }
                }
                Image {
                    id: cloud
                    source: "../assets/images/cloud.png"
                    width: background2.width
                    height: background2.height
                    opacity: 0.7
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: _Inter
                    source: images1[currentIndex1]
                    width: 190
                    height: 200
                    x:30
                    y:400
                    z:1
                }
                Timer{
                    id:_InterTimer
                    interval: 100
                    running: true
                    repeat: true
                    onTriggered: {
                        currentIndex1=(currentIndex1+1)%images1.length//循环每张图
                        _Inter.source=images1[currentIndex1]
                    }
               }
                Image {
                    id: _Inter1
                    source: circle[circleIndex]
                    width: 150
                    height: 150
                    x:50
                    y:430
                    z:2
                }
                Timer{
                    id:_circleTimer
                    interval: 100
                    running: true
                    repeat: true
                    onTriggered: {
                        circleIndex=(circleIndex+1)%circle.length//循环每张图
                        _Inter1.source=circle[circleIndex]
                    }
               }
                Image {
                    id: clouds0
                    source: "../assets/images/clouds.png"
                    width: 1200
                    height: 640
                    y:-200
                }
                Image{
                id:toydoor
                source: "../assets/images/toydoor.png"
                width: _Inter.width+100
                height: _Inter.height+110
                x:-10
                y:_Inter.y-80
                z:_Inter.z
                }
                Loader{
                sourceComponent: bergComponent
                x:toydoor.x+toydoor.width
                y:toydoor.y+70
                               }
                Image {
                    id: road
                    source: "../assets/images/toycloud.png"
                    width: 200
                    height: 100
                    y:_Inter.y+_Inter.height-20
                    x:0
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road1
                    source: "../assets/images/toycloud2.png"
                    width: 200
                    height: 100
                    y:road.y
                    x:road.x+150
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road2
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road1.y+14
                    x:road1.x+150
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road3
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:road2.y
                    x:road2.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: sun
                    source: "../assets/images/sun.png"
                    width: 106
                    height: 105
                    y:200
                    x:road3.x
                    z:2
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road4
                    source: "../assets/images/toycloud3.png"
                    width: 224
                    height: 128
                    y:road3.y-80
                    x:road3.x+200
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road4.y-90
                x:road4.x-50
                }
                Loader{
                sourceComponent: skylight
                y:road4.y-210
                x:road4.x+100
                }
                Image {
                    id: road5
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road1.y+14
                    x:road4.x+250
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road6
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:road2.y
                    x:road5.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road0
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:road6.y-180
                    x:road6.x
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road6.y-100
                x:road6.x
                }
                Image {
                    id: road7
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road2.y
                    x:road6.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image{
                id:ladder
                source:"../assets/images/ladder.png"
                width:279
                height: 159
                y:road2.y-150
                x:road7.x+122
                fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:ladder.y-100
                x:ladder.x+50
                }
                Image {
                    id: road8
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:ladder.y-20
                    x:ladder.x+265
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road9
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road8.y-5
                    x:road8.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road9.y-50
                x:road9.x
                }
                Image {
                    id: road10
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:road8.y-5
                    x:road9.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road10.y-200
                x:road10.x+50
                }
                Image {
                    id: road11
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road8.y-5
                    x:road10.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road11.y+100
                x:road11.x+100
                }
                Image {
                    id: decorate
                    source: "../assets/images/toyCastle.cloud.1.0.png"
                    width: 104
                    height: 66
                    y:road8.y-160
                    x:road10.x+90
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: decorate1
                    source: "../assets/images/toyCastle.cloud.1.0.png"
                    width: 104
                    height: 66
                    y:road8.y-160
                    x:road10.x-90
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image{
                    id:ladder1
                    source:"../assets/images/laddery.png"
                    width:279
                    height: 159
                    y:road2.y-150
                    x:road11.x+120
                    fillMode: Image.PreserveAspectCrop
                    }
                Image {
                    id: berg1
                    source: "../assets/images/bergd.png"
                    width: 114
                    height: 167
                    x:ladder.x+ladder.width-100
                    y:ladder.y-167
                }
                Image {
                    id: berg2
                    source: "../assets/images/bergd.png"
                    width: 114
                    height: 167
                    x:ladder1.x
                    y:ladder1.y-167
                }
                Loader{
                sourceComponent: skylight
                y:ladder1.y+20
                x:ladder1.x+270
                }
                Image {
                    id: road01
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:decorate.y+120
                    x:ladder1.x+280
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road02
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:decorate.y
                    x:road01.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road03
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:decorate.y
                    x:road02.x+180
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road04
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:decorate.y
                    x:road03.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road05
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:decorate.y
                    x:road04.x+150
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image{
                    id:stand
                    source:"../assets/images/toycloud3.png"
                    width: 224
                    height: 128
                    x:ladder1.x+299
                    y:road2.y
                }
                NumberAnimation {
                    id: rightLeftAnimation1
                    target: stand
                    properties: "x"
                    to: stand.x + 400
                    duration: 2000
                    easing.type: Easing.InOutQuad
                    onFinished: rightLeftAnimation_return1.start()
                    }
                NumberAnimation {
                id: rightLeftAnimation_return1
                target: stand
                properties: "x"
                to: stand.x - 400
                duration: 2000
                easing.type: Easing.InOutQuad
                onFinished:rightLeftAnimation1.start()
                }
                Image {
                    id: road12
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road2.y+125
                    x:ladder1.x+299+400+229
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road12.y-300
                x:road12.x
                }
                Image {
                    id: road13
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:road12.y
                    x:road12.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: waterp
                    source: water[waterIndex]
                    width: 235
                    height: 127
                    x:road13.x+50
                    y:road13.y-107
                }
                Timer{
                    id:waterTimer
                    interval: 200
                    running: true
                    repeat: true
                    onTriggered: {
                        waterIndex=(waterIndex+1)%water.length//循环每张图
                        waterp.source=water[waterIndex]
                    }
               }
                Image {
                    id: road14
                    source: "../assets/images/toycloud1.png"
                    width: 127
                    height: 86
                    y:road2.y+125
                    x:road13.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road15
                    source: "../assets/images/toycloud5.png"
                    width: 127
                    height: 86
                    y:road12.y
                    x:road14.x+100
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road15.y-200
                x:road15.x+120
                }
                Image {
                    id: step
                    source: "../assets/images/toycloud.png"
                    width: 242
                    height: 119
                    y:road12.y-150
                    x:road15.x+120
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: step1
                    source: "../assets/images/toycloud2.png"
                    width: 242
                    height: 119
                    y:step.y-150
                    x:step.x+220
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:step1.y+220
                x:step1.x+50
                }
                Image {
                    id: road16
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.11.0.png"
                    width: 300/1.3
                    height: 164/1.3
                    y:step1.y-60
                    x:step1.x+232
                    z:2
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: fireComponent
                x:road16.x+35
                y:road16.y-75
                }
                Loader{
                sourceComponent: cordComponent
                x:road16.x+road16.width+80
                y:road16.y-road16.height-10
                }
                Image {
                    id: bad
                    source: "../assets/images/Obj_dungeon.img.blueCave.set2.11.0.png"
                    width: 61
                    height: 41
                    x:road16.x+80
                    y:-41
                    rotation: 30
                }
                SequentialAnimation{
                    running: shouldAnimate.value
                NumberAnimation {
                            id: full_bad
                            target: bad
                            properties: "y"
                            to: road16.y-30
                            duration: 5000
                            easing.type: Easing.OutQuad
                        }

                }
                Loader{
                sourceComponent: skylight
                y:road16.y-50
                x:road16.x
                }
            Image {
                id: crods
                source: "../assets/images/Obj_acc10.img.timeTemplefire.pillar.10.0.png"
                width: 366
                height: 200
                x:road17.x-60
                y:road17.y+100
            }
                Image {
                    id: road17
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road16.y
                    x:road16.x+215
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road17.y+190
                x:road17.x+140
                }
            Loader{
            sourceComponent: firesComponent
                x:road17.x+100
                y:road17.y-230
            }
                Image {
                    id: road21
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road16.y-200
                    x:road16.x+215
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: fire1Component
                x:road21.x+50
                y:road21.y-230
                rotation: 30
                }
                Image {
                    id: road18
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road16.y
                    x:road17.x+260
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road18.y-120
                x:road18.x+100
                }
                Image {
                    id: ice
                    source: "../assets/images/Obj_acc10.img.timeTempleice.pillar.4.0.png"
                    width: 143*1.5
                    height: 130*1.5
                    y:80
                    x:road18.x+100
                }
                Image {
                    id: ice1
                    source: "../assets/images/Obj_acc10.img.timeTempleice.pillar.6.0.png"
                    width: 365
                    height: 216
                    y:80
                    x:ice.x+ice.width
                }
                Image {
                    id: crods1
                    source: "../assets/images/Obj_acc10.img.timeTemplefire.pillar.11.0.png"
                    width: 366
                    height: 200
                    x:road18.x-60
                    y:road18.y+100
                }
                Image {
                    id: road19
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road16.y
                    x:road18.x+260
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road19.y+200
                x:road19.x-30
                }
                Loader{
                sourceComponent: skylight
                y:road19.y+280
                x:road19.x+150
                }
                Image {
                    id: crack
                    source: "../assets/images/Obj_acc10.img.timeTemplefire.pillar.4.0.png"
                    width: 302
                    height: 166
                    x:road19.x+60
                    y:road19.y +120
                }
                Image {
                    id: road20
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road2.y+80
                    x:road19.x+330
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road20.y-420
                x:road20.x+30
                }
                Loader{
                sourceComponent: fires1Component
                x:road20.x
                y:road20.y-180
                }
                Image {
                    id: road26
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road16.y
                    x:road20.x+330
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                NumberAnimation {
                            id: upDownAnimation1
                            target: road26
                            properties: "y"
                            to: road26.y + 400
                            duration: 2000
                            easing.type: Easing.InOutQuad
                            onFinished: upDownAnimation1_return.start()
                        }
                NumberAnimation {
                            id: upDownAnimation1_return
                            target: road26
                            properties: "y"
                            to: road26.y - 400
                            duration: 2000
                            easing.type: Easing.InOutQuad
                            onFinished:upDownAnimation1.start()
                        }
                Loader{
                sourceComponent: thunderComponent
                x:road26.x
                y:road18.y-100
                }
                Image {
                    id: road28
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road20.y
                    x:road26.x+320
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road28.y-150
                x:road28.x+100
                }
                Image {
                    id: road29
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road20.y
                    x:road28.x+260
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road29.y-300
                x:road29.x+100
                }
                Image {
                    id: road30
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.14.0.png"
                    width: 305
                    height: 121
                    y:road20.y
                    x:road29.x+260
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Loader{
                sourceComponent: skylight
                y:road30.y-80
                x:road30.x
                }
                Image {
                    id: crack1
                    source: "../assets/images/Obj_acc10.img.timeTemplefire.pillar.6.0.png"
                    width: 233
                    height: 103
                    x:road30.x-100
                    y:road30.y-106
                }
                Image {
                    id: road2801
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.12.0.png"
                    width: 190
                    height: 88
                    y:road20.y-250
                    x:road26.x+320
                    z:2
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: cords02
                    source: "../assets/images/Obj_acc10.img.timeTemplefire.pillar.9.0.png"
                    width: 399
                    height: 175
                    x:road2801.x+20
                    y:road2801.y+50
                }
                Image {
                    id: ice3
                    source: "../assets/images/Obj_acc10.img.timeTempleice.pillar.7.0.png"
                    width: 203
                    height: 206
                    x:road2801.x
                    y:20
                }
                Image {
                    id: ice4
                    source: "../assets/images/Obj_acc10.img.timeTempleice.pillar.5.0.png"
                    width: 189
                    height: 228
                    x:ice3.x+203
                    y:20
                }
                Image {
                    id: ice5
                    source: "../assets/images/Obj_acc10.img.timeTempleice.pillar.8.0.png"
                    width: 166
                    height: 150
                    x:ice4.x+189
                    y:20
                }
                Image {
                    id: road2802
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.12.0.png"
                    width: 190
                    height: 88
                    y:road2801.y
                    x:road2801.x+180
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road2803
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.12.0.png"
                    width: 190
                    height: 88
                    y:road2801.y
                    x:road2802.x+180
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: road2804
                    source: "../assets/images/Obj_acc3.img.skyStation.cloud.12.0.png"
                    width: 190
                    height: 88
                    y:road2801.y
                    x:road2803.x+180
                    z:_Inter.z
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: goddess
                    source: "../assets/images/goddess.png"
                    width: 124
                    height: 164
                    y:road2801.y-150
                    x:road2804.x
                }
            Loader{
            sourceComponent: goddessComponent
                x:goddess.x-80
                y:road2804.y-60
                z:2
            }
            }
            Rectangle {
                        id: player2
                        width: 50
                        height: 50
                        color: "red"
                        radius: 25 // 使角色为圆形
                        y:300
                        x:0
                        onXChanged: {
                            // 如果角色到达场景边缘的阈值
                            if (x + width >scrollThreshold &&background2.x>-background2.width*4) {
                                // 移动场景内容（背景和角色）
                                var scrollDistance = x + width - scrollThreshold;
                                background2.x -= scrollDistance;
                                x=gameScene2.width*0.8-player2.width
                            }
                        }

                        MouseArea {
                                  id: dragArea2
                                    anchors.fill: parent
                                    drag.target: parent
                                }
                        // 使角色可以通过水平拖拽移动
                        Drag.active: dragArea2.drag.active
                        Drag.hotSpot.x: player2.width / 2
                        Drag.hotSpot.y: player2.height / 2
                        Drag.onActiveChanged: {
                            if (!dragArea2.drag.active) {
                                x = player2.x
                                y = player2.y
                            }
                        }
                }
        }
    }

    /*关卡4*/
    Page{
        id:_page3
        visible: false
        Rectangle{
            id:gameScene3
            width: 1200
            height: 800
            /*BackgroundMusic{
                    id: _backgroundmusic4
                    volume: 0.5 // 音量设置为50%
                    source: Qt.resolvedUrl("../assets/music/Bgm01.img.MoonlightShadow.mp3") // 使用本地资源
                    loops: SoundEffect.Infinite // 无限循环播放
                    playing:false
                }
            Component.onCompleted:_backgroundmusic4.pause()*/
            Image {
                id: background3
                width: parent.width
                height: parent.height
                source: "../assets/part4/sea1.jpg"
                fillMode: Image.PreserveAspectCrop
                Image {
                    id: background3B
                    x:parent.width
                    width: 1300
                    height: 900
                    source: "../assets/part4/sea1.jpg"
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: background3C
                    x:parent.width*2
                    width: 1300
                    height: 900
                    source: "../assets/part4/sea1.jpg"
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: background3d
                    x:parent.width*3
                    width: 1300
                    height: 900
                    source: "../assets/part4/sea1.jpg"
                    fillMode: Image.PreserveAspectCrop
                }
                Image {
                    id: background3e
                    x:parent.width*4
                    width: 1300
                    height: 900
                    source: "../assets/part4/sea1.jpg"
                    fillMode: Image.PreserveAspectCrop
                }
                /*Image {
                    id: background3f
                    x:parent.width*5
                    width: 1300
                    height: 900
                    source: "../assets/part4/sea1.jpg"
                    fillMode: Image.PreserveAspectCrop
                }*/
                Loader{
                    id:magicloader
                    sourceComponent: magicComponent
                    x:0
                    y:100
                    }
                Image {
                    id: floatgrass
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 186
                    x:magicloader.x-50
                    y:magicloader.y-100
                    rotation: -10
                }
                Image {
                    id: floatgrass1
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 148
                    height: 175
                    x:floatgrass.x+100
                    y:magicloader.y-60
                }
                Image {
                    id: floatgrass2
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 186
                    x:floatgrass1.x+100
                    y:magicloader.y-100
                    rotation: 10
                }
                Image {
                    id: floatgrass3
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 186
                    x:floatgrass.x+100
                    y:magicloader.y-150
                }
                Image {
                    id: floatgrass4
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 186
                    x:floatgrass.x+200
                    y:magicloader.y-170
                }
                Image {
                    id: floatgrass5
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 186
                    x:floatgrass2.x+100
                    y:magicloader.y-100
                    rotation: 10
                }
                Image {
                    id: path0
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 86
                    x:magicloader.x-20
                    y:500
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path0.x+200
                y:path0.y+100
                }
                Image {
                    id: path1
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 75
                    x:path1.x+100
                    y:path0.y
                    z:1
                    }
                Image {
                    id: path2
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 149
                    height: 64
                    x:path1.x+100
                    y:path0.y
                    z:1
                    }
                Image {
                    id: grass
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:path0.x
                    y:path0.y+50
                }
                Image {
                    id: grass0
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:grass.x+150
                    y:grass.y
                }
                Image {
                    id: grass1
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass0.x+150
                    y:grass.y
                }
                Image {
                    id: grass2
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass1.x+150
                    y:grass.y
                }
                Image {
                    id: path3
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 149
                    height: 84
                    x:path2.x+100
                    y:path0.y
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path3.x+80
                y:path3.y-lightComponent.height+300
                }
                Image {
                    id: path4
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 149
                    height: 64
                    x:path3.x+100
                    y:path0.y
                    z:1
                    }
                Image {
                    id: path5
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 149
                    height: 75
                    x:path4.x+100
                    y:path0.y
                    z:1
                    }
                Image {
                    id: path6
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 149
                    height: 64
                    x:path5.x+150
                    y:path0.y+200
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent1
                x:path6.x+100
                y:500
                }
                Image {
                    id: grass3
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:path6.x-30
                    y:path6.y+50
                }
                Image {
                    id: path7
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 149
                    height: 75
                    x:path6.x+100
                    y:path6.y
                    z:1
                    }
                Image {
                    id: grass4
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:path7.x-30
                    y:path7.y+50
                }
                Image {
                    id: path8
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 149
                    height: 86
                    x:path7.x+100
                    y:path6.y
                    z:1
                    }
                Image {
                    id: grass5
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass4.x+150
                    y:grass3.y
                }
                Image {
                    id: path9
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 149
                    height: 75
                    x:path8.x+120
                    y:path6.y-10
                    z:1
                    }
                Image {
                    id: grass6
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass5.x+150
                    y:grass3.y
                }
                Image {
                    id: path10
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 149
                    height: 65
                    x:path9.x+120
                    y:path6.y
                    z:1
                    }
                Image {
                    id: rock
                    source: "../assets/part4/Obj_acc5.img.aquaRoad.frontRock.0.0.png"
                    width:310
                    height: 196
                    x:path10.x-50
                    y:path10.y-150
                }
                Image {
                    id: seastar
                    source: "../assets/part4/Obj_acc5.img.aquaRoad2.acc.25.0.png"
                    width:168*0.7
                    height:76*0.7
                    x:rock.x+100
                    y:rock.y+45
                }
                Loader{
                sourceComponent: lightComponent
                x:path10.x+300
                y:path10.y-500
                }
                Loader{
                sourceComponent: airComponent3
                x:path8.x+130
                y:path10.y-210*1.5
                }
                Loader{
                sourceComponent: lightComponent2
                x:path10.x
                y:300
                }
                Loader{
                    sourceComponent: whaleComponent
                    x:500
                    y:-20
                    }
                Image {
                    id: path11
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 149
                    height: 65
                    x:path10.x+120
                    y:path10.y
                    z:1
                    }
                Loader{
                sourceComponent: airComponent4
                x:path11.x+50
                y:path11.y-30
                }
                Image {
                    id: grass7
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.10.0.png"
                    width: 198
                    height: 93
                    x:grass6.x+150
                    y:grass3.y
                }
                Image {
                    id: path12
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.5.0.png"
                    width: 63
                    height: 52
                    x:path11.x+200
                    y:path11.y
                    z:1
                    }
                Image {
                    id: path13
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.6.0.png"
                    width: 170
                    height: 63
                    x:path12.x+53
                    y:path11.y-70
                    z:1
                    rotation: 125
                    }
                Image {
                    id: path14
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 125
                    height: 88
                    x:path13.x+150
                    y:path13.y-68
                    z:1
                    }
                Loader{
                    sourceComponent: airsComponent
                    x:path14.x+20
                    y:path14.y-200
                      }
                Loader{
                sourceComponent: jellyComponent
                x:path13.x
                y:path13.y-200
                }
                Loader{
                    id:a1
                sourceComponent: bluejellyComponent
                x:path14.x
                y:path14.y-300
                }
                Loader{
                    id:a2
                sourceComponent: redjellyComponent
                x:a1.x+200
                y:a1.y+100
                }
                Loader{
                    id:a0
                sourceComponent: perplejellyComponent
                x:a2.x+100
                y:a2.y-300
                }
                Loader{
                    id:a3
                sourceComponent: redjellyComponent
                x:a2.x+300
                y:a2.y+200
                }
                Image {
                    id: path15
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path14.x+120
                    y:path14.y-100
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path15.x+200
                y:path15.y+100
                }
                Image {
                    id: guidepost
                    source: "../assets/part4/Obj_acc5.img.aquarium.zoo.15.0.png"
                    width: 121
                    height: 109
                    x:path15.x
                    y:path15.y-80
                }
                Image {
                    id: path16
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 149
                    height: 64
                    x:path15.x+180
                    y:path15.y
                    z:1
                    }
                Image {
                    id: turtle
                    source: "../assets/part4/Obj_acc5.img.aquarium.box.0.0.png"
                    width: 112
                    height: 49
                    x:path16.x-80
                    y:path16.y-20
                }
                Image {
                    id: path17
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 149
                    height: 86
                    x:path16.x+130
                    y:path15.y
                    z:1
                    }
                Image {
                    id: path18
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 149
                    height: 86
                    x:path17.x+130
                    y:path15.y+30
                    z:1
                    }
                Image {
                    id: rock2
                    source: "../assets/part4/Obj_acc5.img.aquaRoad.frontRock.1.0.png"
                    width: 352*0.7
                    height: 270*0.7
                    x:path18.x-100
                    y:path18.y-120
                }
                Loader{
                sourceComponent: lightComponent
                x:path18.x-100
                y:path18.y-500
                }
                Image {
                    id: path19
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 125
                    height: 88
                    x:path18.x+200
                    y:path15.y
                    z:1
                    }
                Image {
                    id: flower
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.16.0.png"
                    width: 76
                    height: 66
                    x:path19.x
                    y:path19.y-60
                }
                Loader{
                sourceComponent: lightComponent
                x:path19.x+200
                y:path19.y+100
                }
                Image {
                    id: path20
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path19.x+120
                    y:path15.y
                    z:1
                    }
                Image {
                    id: path21
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path20.x+130
                    y:path15.y-20
                    z:1
                    }
                Image {
                    id: flower1
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.17.0.png"
                    width: 76
                    height: 66
                    x:path21.x+130
                    y:path19.y-60
                }
                Loader{
                sourceComponent: lightComponent
                x:path21.x+200
                y:path21.y-500
                }
                Image {
                    id: path22
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 88
                    x:path21.x+200
                    y:path15.y
                    z:1
                    }
                NumberAnimation {
                    id: path22move
                    target: path22
                    properties: "x"
                    to: path22.x + 400
                    duration: 2000
                    easing.type: Easing.InOutQuad
                    onFinished: path22move_return.start()
                    }
                NumberAnimation {
                id: path22move_return
                target: path22
                properties: "x"
                to: path22.x - 400
                duration: 2000
                easing.type: Easing.InOutQuad
                onFinished:path22move.start()
                }
                Image {
                    id: path23
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 64
                    x:path21.x+730
                    y:path15.y
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path23.x-300
                y:path22.y-100
                }
                Loader{
                sourceComponent: lightComponent
                x:path23.x+200
                y:path23.y+100
                }
                Image {
                    id: path24
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.6.0.png"
                    width: 170
                    height: 63
                    x:path23.x+120
                    y:path23.y+50
                    rotation: 15
                    }
                Image {
                    id: path25
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 64
                    x:path24.x+150
                    y:path24.y+70
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path25.x+300
                y:path25.y-400
                }
                Image {
                    id: path26
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 64
                    x:path25.x+140
                    y:path25.y
                    z:1
                    }
                Loader{
                sourceComponent: fishConponent
                x:path26.x
                y:path26.y-400
                }
                Image {
                    id: path27
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path26.x+140
                    y:path25.y
                    z:1
                    }
                Image {
                    id: path28
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 150
                    height: 88
                    x:path27.x+190
                    y:path25.y
                    z:1
                    }
                Image {
                    id: path29
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 88
                    x:path28.x+140
                    y:path25.y
                    z:1
                    }
                Image {
                    id: path30
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 88
                    x:path29.x+150
                    y:path25.y+30
                    z:1
                    }
                NumberAnimation {
                    id:path30move
                    target: path30
                    property: "y"
                    duration: 2000
                    to:path30.y-400
                    easing.type: Easing.InOutQuad
                    onFinished: path30move_return.start()
                }
                NumberAnimation {
                    id:path30move_return
                    target: path30
                    property: "y"
                    duration: 2000
                    to:path30.y+400
                    easing.type: Easing.InOutQuad
                    onFinished: path30move.start()
                }
                Loader{
                sourceComponent: lightComponent
                x:path30.x+100
                y:path29.y-200
                }
                //shang
                Image {
                    id: path01
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 88
                    x:path30.x+150
                    y:path29.y-300
                    z:1
                    }
                Image {
                    id: path02
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path01.x+140
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path03
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path02.x+140
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path04
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 125
                    height: 88
                    x:path03.x+180
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path05
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path04.x+110
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path06
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path05.x+130
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path07
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 125
                    height: 88
                    x:path06.x+180
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path08
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 88
                    x:path07.x+100
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path09
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 88
                    x:path08.x+130
                    y:path01.y
                    z:1
                    }
                Image {
                    id: path010
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path09.x+130
                    y:path01.y
                    z:1
                    }
                Image {
                    id: house
                    source: "../assets/part4/Obj_acc5.img.aquarium.market.13.0.png"
                    width: 228
                    height: 206
                    x:path08.x+150
                    y:path09.y-170
                }
                Image {
                    id: lighttree
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.18.0.png"
                    width: 368
                    height: 352
                    x:path01.x
                    y:path01.y-280
                    rotation: 18
                }
                Image {
                    id: lighttree1
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.19.0.png"
                    width: 270
                    height: 288
                    x:lighttree.x+350
                    y:lighttree.y+40
                }
                Image {
                    id: lighttree2
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.20.0.png"
                    width: 420
                    height: 330
                    x:lighttree1.x+300
                    y:lighttree.y
                    rotation: -12
                }
                Image {
                    id: lightflower
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.21.0.png"
                    width: 54
                    height: 59
                    x:path01.x+50
                    y:path01.y+75
                    rotation: 200
                }
                Image {
                    id: lightflower0
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.22.0.png"
                    width: 51
                    height: 39
                    x:lightflower.x+50
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower1
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.23.0.png"
                    width: 47
                    height:44
                    x:lightflower0.x+50
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower2
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.24.0.png"
                    width: 56
                    height:44
                    x:lightflower1.x+50
                    y:lightflower.y-30
                    rotation: 200
                }
                Image {
                    id: lightflower3
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.25.0.png"
                    width: 50
                    height:44
                    x:lightflower2.x+50
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower4
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.26.0.png"
                    width: 55
                    height:60
                    x:lightflower3.x+50
                    y:lightflower.y-10
                    rotation: 200
                }
                Image {
                    id: lightflower5
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower4.x+50
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower6
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower5.x+60
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower7
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.21.0.png"
                    width: 54
                    height: 59
                    x:lightflower6.x+60
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower8
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.25.0.png"
                    width: 50
                    height:44
                    x:lightflower6.x+50
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower9
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.26.0.png"
                    width: 55
                    height:60
                    x:lightflower8.x+50
                    y:lightflower.y-10
                    rotation: 200
                }
                Image {
                    id: lightflower10
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower9.x+80
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower11
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower10.x+80
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower12
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower11.x+80
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower13
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower12.x+80
                    y:lightflower.y
                    rotation: 200
                }
                Image {
                    id: lightflower14
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower13.x+80
                    y:lightflower.y
                    rotation: 180
                }
                Image {
                    id: lightflower15
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower14.x+80
                    y:lightflower.y
                    rotation: 180
                }
                Image {
                    id: lightflower16
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower15.x+80
                    y:lightflower.y
                    rotation: 180
                }
                Image {
                    id: lightflower17
                    source: "../assets/part4/Obj_acc6.img.folkvillige.moon1.27.0.png"
                    width: 78
                    height:44
                    x:lightflower16.x+80
                    y:lightflower.y
                    rotation: 180
                }
                Loader{
                sourceComponent: lightComponent
                x:path04.x+200
                y:path04.y-200
                }
                //xia
                Image {
                    id: path31
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 88
                    x:path30.x+150
                    y:path29.y+90
                    z:1
                    }
                Image {
                    id: roadlight
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.29.0.png"
                    width: 187
                    height: 214
                    x:path31.x+20
                    y:path31.y-180
                }
                Image {
                    id: path32
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path31.x+140
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path33
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path32.x+140
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path34
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 125
                    height: 88
                    x:path33.x+180
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path35
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path34.x+110
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path36
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path35.x+130
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path37
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.4.0.png"
                    width: 125
                    height: 88
                    x:path36.x+180
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path38
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.2.0.png"
                    width: 150
                    height: 88
                    x:path37.x+100
                    y:path31.y
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path38.x+200
                y:path37.y-100
                }
                Image {
                    id: path39
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.0.0.png"
                    width: 150
                    height: 88
                    x:path38.x+130
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path40
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.1.0.png"
                    width: 150
                    height: 88
                    x:path39.x+130
                    y:path31.y
                    z:1
                    }
                Image {
                    id: path41
                    source: "../assets/part4/Obj_acc10.img.poisonForest.foot.3.0.png"
                    width: 203
                    height: 107
                    x:path40.x+130
                    y:path31.y
                    z:1
                    }
                Loader{
                sourceComponent: lightComponent
                x:path04.x
                y:path4.y-100
                }
                Image {
                    id: grass8
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:path31.x+20
                    y:path31.y+50
                }
                Image {
                    id: grass9
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:grass8.x+150
                    y:grass8.y
                }
                Image {
                    id: grass10
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass9.x+150
                    y:grass8.y
                }
                Image {
                    id: grass11
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass10.x+150
                    y:grass8.y
                }
                Image {
                    id: grass12
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:grass11.x+150
                    y:grass8.y
                }
                Image {
                    id: grass13
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:grass12.x+150
                    y:grass8.y
                }
                Image {
                    id: grass14
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass13.x+150
                    y:grass8.y
                }
                Image {
                    id: grass15
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.9.0.png"
                    width: 198
                    height: 93
                    x:grass14.x+150
                    y:grass8.y
                }
                Image {
                    id: grass16
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:grass15.x+150
                    y:grass8.y
                }
                Image {
                    id: grass17
                    source: "../assets/part4/Obj_dungeon2.img.deepSee.nature.8.0.png"
                    width: 198
                    height: 93
                    x:grass16.x+150
                    y:grass8.y
                }
                Image {
                    id: flower00
                    source: "../assets/part4/Obj_dungeon2.img.toyCastle2.acc5.27.0.png"
                    width: 119
                    height:134
                    x:path37.x
                    y:path37.y-140
                }
                Image {
                    id: flower01
                    source: "../assets/part4/Obj_dungeon2.img.toyCastle2.acc7.19.0.png"
                    width: 47
                    height:104
                    x:path06.x
                    y:path06.y+90
                }
                Image {
                    id: flower02
                    source: "../assets/part4/Obj_dungeon2.img.toyCastle2.acc7.16.0.png"
                    width: 58
                    height:136
                    x:path04.x
                    y:path35.y-150
                }
                Image {
                    id: flower03
                    source: "../assets/part4/Obj_dungeon2.img.toyCastle2.acc5.25.0.png"
                    width: 140
                    height:146
                    x:path32.x
                    y:path32.y-160
                }
                Loader{
                sourceComponent: preciousComponent
                x:path39.x-100
                y:path39.y-350
                }
                Image {
                    id: lan0
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 63
                    height: 39
                    x:path0.x+50
                    y:path0.y-10
                    z:1
                }
                Image {
                    id: lan01
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan0.x+63
                    y:lan0.y-5
                    z:1
                }
                Image {
                    id: lan02
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan01.x+152
                    y:lan0.y-5
                    z:1
                }
                Image {
                    id: lan03
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan02.x+152
                    y:lan0.y-5
                    z:1
                }
                Image {
                    id: lan04
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.28.0.png"
                    width: 63
                    height: 39
                    x:lan03.x+152
                    y:lan0.y-5
                    z:1
                }
                Image {
                    id: lan05
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 63
                    height: 39
                    x:path6.x+20
                    y:path6.y-15
                    z:1
                }
                Image {
                    id: lan06
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan05.x+63
                    y:lan05.y-5
                    z:1
                }
                Image {
                    id: lan07
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan06.x+152
                    y:lan06.y
                    z:1
                }
                Image {
                    id: lan08
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan07.x+152
                    y:lan06.y
                    z:1
                }
                Image {
                    id: lan09
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan08.x+152
                    y:lan06.y
                    z:1
                }
                Image {
                    id: lan010
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 63
                    height: 39
                    x:path15.x+20
                    y:path15.y-15
                    z:1
                }
                Image {
                    id: lan011
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan010.x+63
                    y:lan010.y
                    z:1
                }
                Image {
                    id: lan012
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan011.x+152
                    y:lan010.y
                    z:1
                }
                Image {
                    id: lan013
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan012.x+152
                    y:lan010.y
                    z:1
                }
                Image {
                    id: lan014
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 63
                    height: 39
                    x:path19.x+20
                    y:path19.y-15
                    z:1
                }
                Image {
                    id: lan015
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan014.x+63
                    y:lan014.y-5
                    z:1
                }
                Image {
                    id: lan016
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan015.x+152
                    y:lan015.y
                    z:1
                }
                Image {
                    id: lan017
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.28.0.png"
                    width: 63
                    height: 39
                    x:lan016.x+152
                    y:lan015.y
                    z:1
                }
                Image {
                    id: lan018
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 80
                    height: 39
                    x:path22.x
                    y:path22.y-10
                    z:1
                }
                Image {
                    id: lan0180
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.28.0.png"
                    width: 63
                    height: 39
                    x:lan018.x+80
                    y:lan018.y
                    z:1
                }
                Image {
                    id: lan019
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 63
                    height: 39
                    x:path23.x+20
                    y:path23.y-15
                    z:1
                }
                Image {
                    id: lan0190
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.28.0.png"
                    width: 63
                    height: 39
                    x:lan019.x+63
                    y:lan019.y
                    z:1
                }
                Image {
                    id: lan020
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:path25.x
                    y:path25.y-15
                    z:1
                }
                Image {
                    id: lan021
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan020.x+152
                    y:lan020.y
                    z:1
                }
                Image {
                    id: lan022
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan021.x+152
                    y:lan020.y
                    z:1
                }
                Image {
                    id: lan023
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.28.0.png"
                    width: 63
                    height: 39
                    x:lan022.x+152
                    y:lan020.y
                    z:1
                }
                Image {
                    id: lan
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.25.0.png"
                    width: 63
                    height: 39
                    x:path31.x+10
                    y:path31.y-10
                    z:1
                }
                Image {
                    id: lan1
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.26.0.png"
                    width: 76
                    height: 39
                    x:lan.x+63
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan2
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan1.x+76
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan3
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan2.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan4
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan3.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan5
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan4.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan6
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan5.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan7
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan6.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan8
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan7.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan9
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan8.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan10
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.27.0.png"
                    width: 152
                    height: 39
                    x:lan9.x+152
                    y:lan.y-5
                    z:1
                }
                Image {
                    id: lan11
                    source: "../assets/part4/Obj_acc5.img.aquarium.acc.28.0.png"
                    width: 63
                    height: 39
                    x:lan10.x+152
                    y:lan.y-5
                    z:1
                }
                }
            Rectangle {
                        id: player3
                        width: 50
                        height: 50
                        color: "red"
                        radius: 25 // 使角色为圆形
                        y:300
                        x:0
                        onXChanged: {
                            // 如果角色到达场景边缘的阈值
                            if (x + width >scrollThreshold &&background3.x>-background3.width*4) {
                                // 移动场景内容（背景和角色）
                                var scrollDistance = x + width - scrollThreshold;
                                background3.x -= scrollDistance;
                                x=gameScene3.width*0.8-player3.width
                            }
                        }

                        MouseArea {
                                  id: dragArea3
                                    anchors.fill: parent
                                    drag.target: parent
                                }
                        // 使角色可以通过水平拖拽移动
                        Drag.active: dragArea3.drag.active
                        Drag.hotSpot.x: player3.width / 2
                        Drag.hotSpot.y: player3.height / 2
                        Drag.onActiveChanged: {
                            if (!dragArea3.drag.active) {
                                x = player3.x
                                y = player3.y
                            }
                        }
                }
        }
    }

    /*边缘组件*/
    Page{
        id:_edgePage
        visible:false
        /*头像*/
        Rectangle{
            x:5
            y:5
            width: 110
            height:110
            radius: 5
            color: "black"
        }

        Rectangle{
            id:_portrait
            x:10
            y:10
            width: 100
            height: 100
            radius: 5
            color: "white"
            Image {
                anchors.fill:parent
                anchors.bottom: parent.bottom // 使图片底部与Rectangle底部对齐
                id:_portrait_image
                source: "../assets/image/portrait.png"
            }
            TapHandler{
                onTapped: {
                    dialogs.portraitDialog.open()
                }
            }
        }

        /*血条*/
        Text{
            text:"HP"
            font.bold: true
            font.pointSize: 17
            color: "red"
            x:_portrait.width+_portrait.x+20
            y:10
        }

        Rectangle{
            width: 210
            height: 40
            radius: 15
            color: "black"
            x:_portrait.width+_portrait.x+55
            y:5
        }

        Rectangle {
            id: healthBar
            width: 200
            height: 30
            radius: 10
            color: "red"
            x:_portrait.width+_portrait.x+60
            y:10
            Rectangle {
                id: healthFill
                width: healthBar.width * 0.6 // 假设生命值为50%，所以宽度为血条宽度的一半
                height: healthBar.height
                radius: 10
                color: "green"
                anchors.left: healthBar.left
                anchors.top: healthBar.top
            }
        }

        /*蓝条*/
        Text{
            text:"MP"
            font.bold: true
            font.pointSize: 16
            color:"blue"
            x:_portrait.width+_portrait.x+20
            y:healthBar.y+healthBar.height+20
        }

        Rectangle{
            width: 210
            height: 40
            radius: 15
            color: "black"
            x:_portrait.width+_portrait.x+55
            y:healthBar.y+healthBar.height+15
        }

        Rectangle {
            id: magicBar
            width: 200
            height: 30
            radius: 10
            color: "yellow"
            x:_portrait.width+_portrait.x+60
            y:healthBar.y+healthBar.height+20
            Rectangle {
                id: magicFill
                width: magicBar.width * 0.4 // 假设生命值为50%，所以宽度为血条宽度的一半
                height: magicBar.height
                radius: 10
                color: "blue"
                anchors.left: magicBar.left
                anchors.top: magicBar.top
            }
        }

        /*背包*/
        Rectangle{
            id:_bag
            x:10
            y:_portrait.y+_portrait.height+30
            width: 50
            height: 50
            color:"transparent"
            TapHandler{
                onTapped: {dialogs.bagDialog.open()}
            }
            Image {
                anchors.fill: parent
                source: "../assets/image/bag1.png"
            }
        }

        /*属性*/
        Rectangle{
            id:_attribute
            x:10
            y:_bag.y+_bag.height+30
            width:50
            height:50
            color:"transparent"
            Image {
                anchors.fill: parent
                source: "../assets/image/attribute.png"
            }
            TapHandler{
                onTapped: {dialogs.attributeDialog.open()}
            }
        }

        /*退出*/
        Button{
            id:exitButton
            width:60
            height:40
            text:"退出"
            x:10
            y:_choose.height-exitButton.height-10
            onClicked: {dialogs.exitDialog.open()}
        }
    }
    /*Actions{
        id:actions
    }*/
    Dialogs{
        id:dialogs
    }
}

