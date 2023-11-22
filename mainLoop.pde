import oscP5.*;
import netP5.*;
import ketai.sensors.*;

OscP5 oscP5;
int it,x,y;
KetaiSensor sensor;
Level1State state1;
MenuState state2;
NetAddress remoteLocation;
float myAccelerometerX, myAccelerometerY, rAccelerometerX, rAccelerometerY;
int targetX, targetY,remoteTargetX, remoteTargetY;


void setup(){
  state2 = new MenuState();
  state1 = new Level1State();
  sensor = new KetaiSensor(this);
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
  sensor.start();
  strokeWeight(5);
  init();
}

void onAccelerometerEvent(float _x,float _y, float _z){
  myAccelerometerX = _x;
  myAccelerometerY = _y;
}


void draw(){
 StateManager manager = new StateManager(state2); 
 if(it == 2){
   manager = new StateManager(state1);
 }else if(it == 1){
   manager = new StateManager(state2);
 }
}





void buttonBack(int posx, int posy, int w, int h){
  rect(posx,posy,w,h);
  text("BACK", posx, posy);
  if(mousePressed){
    if(mouseX>posx&&mouseX<posx+w&&mouseY>posy&&mouseY<posy+h){
    it = 1;
    }
  }
}

void buttonStart(int posx, int posy, int w, int h){
  fill(0);
  rect(posx,posy,w,h);
  fill(255);
  text("START", posx, posy);
  if(mousePressed){
    if(mouseX>posx&&mouseX<posx+w&&mouseY>posy&&mouseY<posy+h){
      it = 2;
    }
  }
}
void init(){
  x = int(random(25, width-25));
  y = int(random(25, height-25));
  targetX = int(random(25, width-35));
  targetY = int(random(25, height-35));
}