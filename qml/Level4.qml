import QtQuick

Item {
id:level
Ground{id:path0_G;x:background3.x;y:path0.y+30;width: path0.width+500;height: 20}
Ground{id:path6_G;x:path0_G.x+650;y:path6.y+30;width: path6.width+550;height: 20}
Ground{id:path12_G;x:path6_G.x+550+210;y:path12.y+20;width: path12.width;height: 20}
Ground{id:path13_G;x:path12_G.x+58;y:path13.y+95;width: 220;height: 20;rotation: -40}
Ground{id:path14_G;x:path13_G.x+160;y:path14.y+20;width: path14.width;height: 20}
Ground{id:path15_G;x:path14_G.x+120;y:path15.y+30;width: path15.width+350;height: 20}
Ground{id:path19_G;x:path15_G.x+350+300;y:path19.y+25;width: path19.width+300;height: 20}
Ground{x:background3.x+path22.x;y:path22.y+25;width: path22.width;height: 20}
Ground{id:path23_G;x:path19_G.x+300+660;y:path23.y+25;width: path23.width-20;height: 20}
Ground{id:path24_G;x:path23_G.x+138;y:path24.y-20;width: 220;height: 20;rotation: 36}
Ground{id:path25_G;x:path24_G.x+160;y:path25.y+20;width: path25.width+420;height: 20}
Ground{id:path29_G;x:path25_G.x+420+170;y:path29.y+50;width: path29.width-30;height: 20}
Ground{id:path30_G;x:path29_G.x+150;y:path30.y+30;width: path30.width-30;height: 20}
Ground{id:path31_G;x:path30_G.x+150;y:path31.y+25;width: path31.width+1300;height: 20}
Ground{id:path01_G;x:path31_G.x;y:path01.y+25;width: path01.width+1200;height: 20}
/*House{
id:house_G
x:background3.x+house.x
y:house.y
width: house.width
height: house.height
onContact: {
_player4.x=path31.x
_player4.y=path31.y-300
background3.x=path31.x
}
}*/
End{
x:path31_G.x+1200
y:path31_G.y-200
width: 100
height: 200
}
}
