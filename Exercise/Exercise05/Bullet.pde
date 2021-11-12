class Bullet{
  Box box;
  float x;
  float y;
  float w;
  float h;
  int lifetime = 1000;
  int timestamp;
  boolean isAlive = true;
  
  Bullet(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    timestamp  = millis();
    
    box = new Box(x,y,w,h);
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
    //Stolen from Nick's bullet code
    if (isAlive && millis() > timestamp + lifetime){
      isAlive = false;
      box.killBody();
    }
    
    if(isAlive){
      box.update();
    }
  }
  
  void draw(){
    fill(0);
    ellipse(x, y, w, h);
  }
}
