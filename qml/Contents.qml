import QtQuick
import QtMultimedia
import QtQuick.Controls
import Felgo
Item {
    Rectangle{
        MediaPlayer {
                id: backgroundMusic
                audioOutput: AudioOutput{
                volume: 0.5 // 音量设置为50%
                }
                source: "music/shou.mp3" // 使用本地资源
                loops: MediaPlayer.Infinite // 无限循环播放
            }
        Image {
            id: background
            source: "../assets/images/bj.jpg"
            width:1200
            height:800
        }
        Image{
            id:start

            source:"../assets/images/start1.png"
            width:400
            height:200
            x:400
            y:300
            TapHandler{
            onTapped:{
                components.choose.visible=true
                start.visible=false
                components.container.visible=true
        }
    }
}
    }
    MyRectangle{

    }
    Components{
        id:components
    }
}
