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
                source:Qt.resolvedUrl("../assets/music/shou.mp3")  // 使用本地资源
                loops: MediaPlayer.Infinite // 无限循环播放
                Component.onCompleted:play()
            }
        /*GameSoundEffect{
        id:back
        loops:SoundEffect.Infinite
        resources: Qt.resolvedUrl("../assets/shou.mp3")
        Component.onCompleted:play()
        }*/
        /*BackgroundMusic{
        id:backgroudmusic
        source: Qt.resolvedUrl("../assets/music/shou.mp3")
        volume: 0.5 // 音量设置为50%
        loops: SoundEffect.Infinite
        autoPlay: true
        //Component.onCompleted:play()
        }*/
        //Component.onCompleted:{backgroundmusic.play()}
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
