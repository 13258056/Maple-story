import QtQuick
import QtQuick.Controls

Item {
    property alias exitDialog:_exitDialog
    property alias portraitDialog:_portraitDialog
    property alias bagDialog:_bagDialog
    property alias attributeDialog:_attributeDialog
    property alias shopDialog:_shopDialog

    /*退出游戏界面窗口*/
    Dialog{
        id:_exitDialog
        property real offsetX: (choose.width - width) / 2
        property real offsetY: (choose.height - height) / 2
        x: offsetX
        y: offsetY
        width: 600
        height: 450

        Text {
            id:text1
            text: qsTr("警告！！！")
            color:"red"
            y:parent.height/4
            x:(parent.width-width)/2+50
            font.pointSize: 40
        }
        Text{
            width:300
            height:150
            text: qsTr("是否继续退出当前关卡，关卡进度会保存")
            font.pointSize: 16
            x:100
            y:parent.height/4+text1.height
        }

        Button{
            width: 94
            height:38
            x:(parent.width-width)/2
            y:3*parent.height/4
            Image{
                id:image
                width: 94
                height:38
                source:"image/image44.png"
            }
            onPressed: {
                image.source="image/image42.png"
            }
            onReleased: {
                image.source = "image/image44.png"
            }

            onClicked: {
                _backgroundMusic.pause()
                _backgroundMusic2.pause()
                _backgroundMusic3.pause()
                _backgroundMusic4.pause()
                components.page0.visible=false
                components.page1.visible=false
                components.page2.visible=false
                components.page3.visible=false
                _exitDialog.visible=false
                components.edgePage.visible=false
                //返回关卡选择界面
                container.visible=true
                backgroundMusic.play()
            }
        }
    }

    /*点击头像窗口*/
    Dialog{
        id:_portraitDialog
        property real offsetX: (choose.width - width) / 2
        property real offsetY: (choose.height - height) / 2
        x: offsetX
        y: offsetY
        width: 800
        height:600
    }

    /*背包窗口*/
    Dialog{
        id:_bagDialog
        property real offsetX: (choose.width - width) / 2
        property real offsetY: (choose.height - height) / 2
        x: offsetX
        y: offsetY
        width: 340
        height:370
        Image {
            anchors.centerIn: parent
            width: parent.width*1.1
            height:parent.height*1.1
            source: "image/bagDialog.png"
        }

    }

    /*属性窗口*/
    Dialog{
        id:_attributeDialog
        x: (choose.width - width) / 2
        y: (choose.height - height) / 2
        width: 478*1.4
        height:353*1.4
        Image {
            source: "image/attributeDialog.png"
            anchors.centerIn: parent
            width: parent.width*1.1
            height:parent.height*1.1
        }
    }

    /*商城窗口*/
    Dialog{
        id:_shopDialog
        property real offsetX: (choose.width - width) / 2
        property real offsetY: (choose.height - height) / 2
        x: offsetX
        y: offsetY
        width: 463*1.8
        height:339*1.8
        Image {
            source: "image/shopDialog.png"
            anchors.centerIn: parent
            width: parent.width*1.1
            height:parent.height*1.1
        }
    }
}
