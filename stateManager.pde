class State{
  String stateName;
  int stateId;
  int level;
}

class StateManager{
  int currentState;
  
  StateManager(State state){
    this.currentState = state.stateId;
    this.enterState();
  }
  void enterState(){
    if(this.currentState == 1){
      MenuState state1 = new MenuState();
      state1.update();
      state1.play();
    }else if(this.currentState == 2){
      Level1State state1 = new Level1State();
      state1.update();
      state1.play();
    }
  }
  
}

class MenuState extends State{
  MenuState(){
    this.stateName = "menu";
    this.stateId = 1;
    this.level = 0;
  }
  
  int update(){
    return this.level;
  }
  void play(){
    background(78,93,75);
    stroke(255);
    fill(0);
    text("start level :"+(this.update()),width/4,height/4);
    buttonStart(width/2,height/2,90,90);
  }
}
class Level1State extends State{
  int score;
  float speedX, speedY;
  Level1State(){
    this.stateName = "level1";
    this.stateId = 2;
    this.speedX = .1;
    this.speedY = .1;
    this.score = 0;
    this.level = 1;
  }
  int update(){
    return this.level;
  }
  void play(){
  background(78,93,75);
  fill(0);
  stroke(0,60,0);
  ellipse(targetX, targetY,70, 70);
  //stroke(60,0,0);
  
  noStroke();
  fill(255);
  text(this.score, targetX, targetY);
  
  this.speedX += (myAccelerometerX + rAccelerometerX)*0.1;
  this.speedY += (myAccelerometerY + rAccelerometerY)*0.1;
  if(x<25+this.speedX||x>height-25+this.speedX){
    this.speedX *= -0.8;
  }
  if(y<=25-this.speedY||y>height-25-speedY){
    this.speedY *=-0.8;
  }
  x -=this.speedX;
  y +=this.speedY;
  ellipse(x,y,20,20);
  if(dist(x,y,targetX,targetY)<10){
    this.score++;
    //background(60,0,0);
    init();
  }
  buttonBack(width/16,height/16,15,9);
  //f(this.score == 2){
    //MenuState state = new MenuState();
    //StateManager manager = new StateManager(state);
  //}
 }
  
}