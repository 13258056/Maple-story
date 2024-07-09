import QtQuick

Item {
id:level
Ground{x:background2.x;y:600;width: 504;height: 10}
Ground{x:background2.x+600;y:road4.y+10;width:road4.width;height:road4.height}
Ground{x:background2.x+600+250;y:road5.y+10;width:322;height:road5.height}
Ground{x:background2.x+600+250+100;y:road0.y+10;width: road0.width;height: road0.height}
Ground{x:background2.x+600+250+322;y:ladder.y+160;width:250;height:80;rotation: -40}
Ground{x:background2.x+600+250+322+185;y:ladder.y;width: 550;height:10}
Ground{x:background2.x+600+250+322+185+560;y:ladder1.y;width:250;height:80;rotation: 40}
Ground{id:ladder1_G;x:background2.x+600+250+322+185+550+175;y:ladder1.y+150;width: 90;height: 20}
Ground{x:background2.x+stand.x;y:stand.y+50;width: stand.width;height: stand.height}
Ground{id:road01_G;x:ladder1_G.x+50;y:road01.y+10;width: road01.width;height: 20}
Ground{id:road02_G;x:road01_G.x+100;y:road02.y+10;width: road02.width;height: 20}
Ground{id:road03_G;x:road02_G.x+180;y:road03.y+10;width: road03.width+100;height: 20}
Ground{id:road05_G;x:road03_G.x+250;y:road05.y+10;width: road05.width;height: 20}
Ground{id:road12_G;x:ladder1_G.x+299+400;y:road12.y+10;width: road12.width+300;height: 20}
Ground{id:step_G;x:road12_G.x+430;y:step.y+10+30;width: step.width;height: step.height}
Ground{id:step1_G;x:step_G.x+200;y:step1.y+10+60;width: step1.width;height: step1.height}
Ground{id:road16_G;x:step1_G.x+238;y:road16.y+50;width:road16.width+800;height: 20}
Ground{x:road26_G.x-300;y:road20.y+10;width:road20.width;height:20}
Ground{id:road26_G;x:background2.x+road26.x;y:road26.y;width: road26.width;height: road26.height}
Ground{id:road28_G;x:road26_G.x+320;y:road28.y+20;width: road28.width+400;height: 20}
Ground{x:road28_G.x;y:road2801.y+20;width: road2801.width+450;height: 20}
/*Monster{x:background2.x+rabbit01.x;y:rabbit01.y;width: rabbit01.width;height: rabbit01.height}
Monster{x:background2.x+lrabbit01.x;y:lrabbit01.y;width: lrabbit01.width;height: lrabbit01.height}
Monster{x:background2.x+mao01.x;y:mao01.y;width: mao01.width;height: mao01.height}
Monster{x:background2.x+lmao01.x;y:lmao01.y;width: lmao01.width;height: lmao01.height}
Monster{x:background2.x+mao02.x;y:mao02.y;width: mao02.width;height: mao02.height}
Monster{x:background2.x+lmao02.x;y:lmao02.y;width: lmao02.width;height: lmao02.height}
Monster{x:background2.x+mao03.x;y:mao03.y;width: mao03.width;height: mao03.height}
Monster{x:background2.x+lmao03.x;y:lmao03.y;width: lmao03.width;height: lmao03.height}
Monster{x:background2.x+unq01.x;y:unq01.y;width: unq01.width;height: unq01.height}
Monster{x:background2.x+lunq01.x;y:lunq01.y;width: lunq01.width;height: lunq01.height}*/
End{
x:road28_G.x+450;y:goddess.y+20;width: goddess.width;height: goddess.height
}
}
