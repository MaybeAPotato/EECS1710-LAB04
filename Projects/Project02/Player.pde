class Player{
  PVector pos;
  PVector startingPos;
  float speed = 1.5f;
  float startingAccel = 1.0f;
  float accelIncreaseRate = 0.15f;
  float accel = startingAccel;
  float playerWidth = 50.0f;
  float playerHeight = 50.0f;
  int score = 0;
  
  Player(PVector _pos){
    pos = _pos;
    startingPos = new PVector(_pos.x,_pos.y,_pos.z);
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){    
    if(pos.x + playerWidth/2 < endLinePos.x){
      if(keyNum == 32 && keyDown == true){
        pos.x += speed * accel;
      }
    }
    else{
      keyDown = false;
      pos = startingPos;
      
      score++;
    }
  }
  
  void draw(){
    fill(0,127,0);
    rectMode(CENTER);
    rect(pos.x,pos.y,playerWidth,playerHeight);
    
    fill(255);
    textSize(32);
    text(score,width/2,height * 5.0f/6.0f);
    
    fill(255);
    textSize(32);
    text(score,width/2,height * 6.0f/7.0f);
  }
  
  
}
