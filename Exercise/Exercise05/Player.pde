class Player{
  Body body;
  // Define a polygon (this is what we use for a rectangle)
  PolygonShape sd;
  // Define a fixture
  FixtureDef fd; 
  // Define the body and make it from the shape
  BodyDef bd;
  Vec2 center;
  
  float scaleAmp = 1000;
  float scaleAmpInc = 100;
  float scaleFreq = 1000;
  float x;
  float y;
  float w;
  float h;
  float defaultH;
  float speed = 5.0f;
  int score = 0;
  boolean debug = false;

  Player(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    defaultH = h;
    center = new Vec2(x,y);
    
    makeBody(center, w, h);
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){

    
    //Move left (A)
    if(keyNum == 65 && keyDown || keyNum == 97 && keyDown){
      x -= speed;
    }
    //Move right (D)
    else if(keyNum == 68 && keyDown || keyNum == 100 && keyDown){
      x += speed;
    }
    //Increase scale (W)
    if(keyNum == 87 && keyDown || keyNum == 119 && keyDown){
      scaleAmp += scaleAmpInc;
    }
    //Decrease scale (S)
    else if(keyNum == 83 && keyDown || keyNum == 115 && keyDown){
      scaleAmp -= scaleAmpInc;
    }
    
    
    center.x = x;
    center.y = y;
    
    h = amp * scaleAmp + defaultH;
    alterBox();
  }
  
  void draw(){
    rectMode(CENTER);
    //float fillValR = constrain(map(freq, 0, scaleFreq, 0, 255), 0, scaleFreq);
    //float fillValG = constrain(map(freq, 0, scaleFreq, 0, 127), 0, scaleFreq);
    //float fillValB = constrain(map(freq, 0, scaleFreq, 0, 63), 0, scaleFreq);
    fill(127, 0, 0);
    rect(x, y, 250, h);
    
    text("AMP SCALE (W or S)\n"  + (int)scaleAmp, width/2, 100);
    
    if(debug){
      textSize(32);
      fill(255);
      text("AMP "  + amp, 50, 100);
      text("FREQ " + freq, 50, 150);
    }
  }
  
  void alterBox(){
    box2d.destroyBody(body);
    
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    fd.shape = sd;
    
    bd.position.set(box2d.coordPixelsToWorld(center));
    
    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
  
  void setDebug(boolean b){
    debug = b;
  }
  
  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 _center, float w_, float h_) {

    // Define a polygon (this is what we use for a rectangle)
    sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Define the body and make it from the shape
    bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(_center));

    body = box2d.createBody(bd);
    body.createFixture(fd);

    // Give it some initial random velocity
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }

}
