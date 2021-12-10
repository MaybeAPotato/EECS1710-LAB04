PShader shader;
PGraphics pg;
Crosshair c;
ParallaxBackground pBG;

void setup(){
  size(512,512,P2D);
  pg = createGraphics(512, 512, P2D);
  
  noCursor();
  
  c = new Crosshair();
  pBG = new ParallaxBackground("ocean.png",2);
  
  
  shader = loadShader("example.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("rate", 0.1);
  
  pg.beginDraw();
  pg.background(0);
  pg.endDraw();
}

void draw(){
  background(0);
  
  pg.beginDraw();
  pBG.run();
  imageMode(CORNER);
  //DRAW etc etc
  
  //Shader drawing
  shader.set("time", float(millis())/1000.0);
  shader.set("tex0", pg);
  pg.filter(shader);
  
  pg.blendMode(BLEND);
  pg.noStroke();
  pg.fill(0, 0, 0, 0);
  pg.rect(0, 0, width, height);
  
  pg.endDraw();
  
  image(pg, 0, 0);
  
  c.run();
}
