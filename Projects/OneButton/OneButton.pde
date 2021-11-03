PVector startingPos;
PVector endLinePos;

PVector eyeStartingPos;

Player thePlayer;
Eye theEye;
EndLine theEndLine;

void setup(){
  size(800,600,P2D);
  startingPos = new PVector(width/10, height/2);
  endLinePos = new PVector(width * 6.0f/8.0f, height/2);
  
  thePlayer = new Player(startingPos);
  
  PVector temp = new PVector(endLinePos.x + 100, endLinePos.y);
  
  theEye = new Eye(temp, thePlayer);
  theEndLine = new EndLine();
  
  print(frameRate);
}

void draw(){
  background(127);
  thePlayer.run();
  theEye.run();
  theEndLine.run();
  
  fill(255);
  textSize(32);
  text("Hold spacebar to move",width/4,height/8);
  
}
