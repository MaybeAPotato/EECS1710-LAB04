class Dot {
  PVector position, target, originalPos;
  color col;
  float speed;
  float dotSize;
  float maxSpeed;
  boolean ready;
  
  Dot(float x, float y, color _col, PVector _target) {
    position = new PVector(x, y);
    originalPos = new PVector(x,y);
    col = _col;
    target = _target;
    speed = 0.01;
    dotSize = 10;
    ready = false;
  }
  
  Dot(float x, float y, color _col, float _maxSpeed) {
    position = new PVector(x, y);
    originalPos = new PVector(x,y);
    col = _col;
    target = position;
    maxSpeed = _maxSpeed;
    speed = random(maxSpeed);
    dotSize = 10;
    ready = false;
  }
  
  float distanceToTarget(){
    return PVector.dist(position,target);
  }
  
  void setTarget(float _x, float _y){
    target = new PVector(_x,_y);
  }
  
  void setTarget(PVector newTarget){
    target = newTarget;
  }
  
  void setTargetOrgPos(){
    target = originalPos;
  }
  
  void reSetSpeed(){
    speed = random(maxSpeed);
  }
  
  void reSetSpeed(float _maxSpeed){
    maxSpeed = _maxSpeed;
    
    speed = random(maxSpeed);
  }
  
  void setSpeed(float s){
    speed = random(s) + 0.01f;
  }
  
  void setOriginalPos(PVector newOrg){
    originalPos = newOrg;
  }
  
  
  void run() {
    update();
    draw();
  }
  
  void update() {
    position.lerp(target, speed);
    ready = position.dist(target) < 5;
  }
  
  void draw() {
    stroke(col);
    strokeWeight(dotSize);
    point(position.x, position.y);
  }
  


}
