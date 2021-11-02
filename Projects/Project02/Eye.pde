class Eye{
  Player playerToWatch;
  PVector pos;
  float eyeWidth = 100.0f;
  float eyeHeight = 100.0f;
  float timePassed = 0.0f;
  
  Eye(PVector _pos, Player p){
    playerToWatch = p;
    pos = _pos;
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
    timePassed++;
  }
  
  void draw(){
    fill(0);
    rectMode(CENTER);
    rect(pos.x,pos.y,eyeWidth,eyeHeight);
  }
  
  float getTimePassed(){
    return timePassed;
  }
}
