Crosshair c;
ParallaxBackground pBG;

void setup(){
  size(800,600,P2D);
  noCursor();
  
  c = new Crosshair();
  pBG = new ParallaxBackground("space_bg.jpg",2);
}

void draw(){
  background(127);
  
  pBG.run();
  
  c.run();
}
