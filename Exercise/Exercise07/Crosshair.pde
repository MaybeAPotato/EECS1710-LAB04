class Crosshair{
  PShape crosshair;
  AimThing aimThing;
  
  Crosshair(){
    aimThing = new AimThing();
    
    crosshair = createShape();
    crosshair.beginShape();
    
    crosshair.stroke(127);
    crosshair.fill(255,0,0);
    
    crosshair.vertex(width/2,(height/2)-20);
    crosshair.vertex((width/2)+20,height/2);
    crosshair.vertex(width/2,(height/2)+20);
    crosshair.vertex((width/2)-20,height/2);
    
    crosshair.beginContour();
    crosshair.vertex(width/2,(height/2)-10);
    crosshair.vertex((width/2)-10,height/2);
    crosshair.vertex(width/2,(height/2)+10);
    crosshair.vertex((width/2)+10,height/2);
    crosshair.endContour();
    
    crosshair.endShape();
  }
  
  void update(){
  }
  
  void draw(){
    shapeMode(CORNER);
    shape(crosshair,mouseX-width/2,mouseY-height/2);
  }
  
  void run(){
    aimThing.run();
    update();
    draw();
  }
  
}
