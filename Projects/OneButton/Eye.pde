class Eye{
  Player playerToWatch;
  PVector pos;
  PVector eyeOpenColour = new PVector(69,0,0);
  float eyeWidth = 100.0f;
  float eyeHeight = 100.0f;
  float timePassed = 0.0f;
  float timeTrigger = 3.0f;
  float eyeOpenTime = 4.0f;
  boolean isLooking = false;
  
  Eye(PVector _pos, Player p){
    playerToWatch = p;
    pos = _pos;
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){ 
    float waitFor = isLooking == false ? timeTrigger : eyeOpenTime;
    
    if(timePassed < waitFor){
      timePassed+= 1.0f/frameRate;
    }
    else{
      timePassed = 0.0f;
      isLooking = isLooking ? false : true; 
    }
    
    if(isLooking && playerToWatch.isMoving){
      KillThePlayer();
    }
  }
  
  void draw(){
    if(isLooking == false){
      fill(0);
      rectMode(CENTER);
      rect(pos.x,pos.y,eyeWidth,eyeHeight);
    }
    else{
      fill(eyeOpenColour.x,eyeOpenColour.y,eyeOpenColour.z);
      rectMode(CENTER);
      rect(pos.x,pos.y,eyeWidth,eyeHeight);
    }
    
    //debug
    fill(255);
    textSize(32);
    text(timePassed,width/2,height * 5.0f/6.0f);
  }
  
  void KillThePlayer(){
    timePassed = 0.0f;
    isLooking = false;
    
    playerToWatch.KillPlayer();
  }
  
  float getTimePassed(){
    return timePassed;
  }
}
