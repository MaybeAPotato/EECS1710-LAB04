int keyNum = 0;
boolean isMouseDown = false;
boolean isKeyDown = false;

void keyPressed(){
  isKeyDown = true;
  keyNum = keyCode;
}

void keyReleased(){
  isKeyDown = false;
}

void mousePressed(){
  isMouseDown = true;
}

void mouseReleased(){
  isMouseDown = false;
}
