int keyNum = 0;
boolean keyDown = false;

void keyPressed(){
  keyNum = keyCode;
  keyDown = true;
}

void keyReleased(){
  keyDown = false;
}
