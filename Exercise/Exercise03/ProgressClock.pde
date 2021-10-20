class ProgressClock{  
  PVector[] hourPos = new PVector[12];
  PVector hourCursor = new PVector();
  float hourStartPosX = 75.0f;
  float hourStartPosY = 50.0f;
  
  float hourWidth = 64;
  float ampmWidth = 32;
  
  float minuteLength = 384;
  
  float secondLength = minuteLength;
  
  ProgressClock(){
    for(int i = 0; i < hourPos.length; i++){
      print(i % 6);
      hourPos[i] = new PVector();
      hourPos[i].x = hourStartPosX +  (hourWidth * (i % 6));
      hourPos[i].y = i < 6 ? hourStartPosY : hourStartPosY * 2.5f;
    }
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
  }
  
  void draw(){
    int s = second();
    int m = minute();
    int h = hour();
    
      //Hour
    fill(0,0,0);
    
    for(int i = 0; i < hourPos.length; i++){
      int tempH = h < 12 && h > 0 ? h-1 : h/2;
      
      if(i != tempH)
        fill(0);
      else
        fill(255);
      
      ellipse(hourPos[i].x,hourPos[i].y,hourWidth,hourWidth);
    }
    
    //AM/PM
    ellipse(hourPos[5].x + hourWidth, hourPos[5].y+12, ampmWidth, ampmWidth);
    text("AM",hourPos[5].x + hourWidth + ampmWidth, hourPos[5].y+12);
    ellipse(hourPos[11].x + hourWidth, hourPos[11].y-12, ampmWidth, ampmWidth);
    text("PM",hourPos[11].x + hourWidth + ampmWidth, hourPos[11].y+12);
    
    if(h < 12){
      fill(255);
      ellipse(hourPos[5].x + hourWidth, hourPos[5].y+12, ampmWidth, ampmWidth);
    }
    else{
      fill(255);
      ellipse(hourPos[11].x + hourWidth, hourPos[11].y-12, ampmWidth, ampmWidth);
    }
      
    
    //Minutes
    fill(0,0,0);
    rect(hourStartPosX - hourWidth/2,hourStartPosY * 4,minuteLength,50);
    fill(255);
    rect(hourStartPosX - hourWidth/2,hourStartPosY * 4,minuteLength * (m/60.0f),50);
    
    //Seconds
    fill(0,0,0);
    rect(hourStartPosX - hourWidth/2,hourStartPosY * 6,secondLength,50);
    fill(255);
    rect(hourStartPosX - hourWidth/2,hourStartPosY * 6,secondLength * (s/60.0f),50);
  }
}
