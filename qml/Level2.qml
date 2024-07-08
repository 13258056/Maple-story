import QtQuick
import Felgo

Item {
    id:level

Ground{x:background1.x;y:485;width:960;height:430}
Ground{x:background1.x+960;y:485;width: 806;height: 554;rotation: 40}
Ground{x:background1.x+960;y:605;width: 400;height: 50;rotation: 15}
Ground{x:background1.x+960+350;y:716;width: 200;height: 554}
Ground{x:background1.x+1510+150;y:740;width: 128;height: 74}
Ground{x:background1.x+1510+250+128;y:740;width: 128;height: 74}
Ground{x:background1.x+1510+250+128+100+128;y:660;width: 200;height: 166}
Ground{x:background1.x+2116+175;y:660;width:500;height: 50;rotation: -10}
Ground{x:background1.x+_stand3.x;y:_stand3.y;width:200;height:20}
Ground{x:background1.x+_stand4.x;y:_stand4.y;width:200;height:20}
}
