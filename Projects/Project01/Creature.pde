class Creature {

  boolean debug = true;
  PVector position, target;
  PImage faceCurrent, face01, face02, face03, face04;
  float margin = 50;
  int foodChoice;
  
  boolean isBothered = false;
  int botheredMarkTime = 0;
  int botheredTimeout = 3000; // Processing measures time in milliseconds
  float botheredSpread = 5;
  
  boolean isBlinking = false;
  int blinkMarkTime = 0;
  int blinkTimeout = 4000;
  int blinkDuration = 250;
  
  boolean isHunting = false;
  boolean isAlive = true;
  Creature prey = null;
  
  float triggerDistance1 = 100;
  float triggerDistance2 = 25;
  float movementSpeed = 0.08;
  
  int sizeX = 100;
  int sizeY = 100;
  
  float hunger = 100.0f;
  float hungerDecayRate = 0.1f;
  float hungerBotheredDecayRate = 0.3f;
  float hungerTolerance = 25.0f;
  
  int ID = -1;
  
    
  // This is the constructor; it needs to have the same name as the class.
  Creature(float x, float y, int size, float h, int cID) {
    position = new PVector(x, y);
    
    sizeX = size;
    sizeY = sizeX;
    
    hunger = h;
    
    ID = cID;
    
    pickEscapeTarget();
    
    face01 = loadImage("face01.png");
    face01.resize(sizeX, sizeY);// neutral expression
    face02 = loadImage("face02.png");// worried expression
    face02.resize(face01.width, face01.height);
    face03 = loadImage("face03.png");// happy expression
    face03.resize(face01.width, face01.height);
    face04 = loadImage("face04.png");// blink with happy expression
    face04.resize(face01.width, face01.height);
    
    faceCurrent = face01;
  }
  
  void update() {
    if(isAlive){
      PVector mousePos = new PVector(mouseX, mouseY);
      isBothered = position.dist(mousePos) < triggerDistance1;
      
      int bRate = isBothered ? 1 : 0;
      hunger -= hungerDecayRate + (hungerBotheredDecayRate * bRate);
      
      isAlive = hunger > 0.0f ? true : false;
      
      //Bothered
      if (isBothered) {
        isHunting = false;
        botheredMarkTime = millis();
        faceCurrent = face02; // worried expression
        if (position.dist(target) < triggerDistance2) {
          pickEscapeTarget();
        }
      }
      //Transitioning between bothered and neutral
      else if (!isBothered && millis() > botheredMarkTime + botheredTimeout) {
        if (!isBlinking && millis() > blinkMarkTime + blinkTimeout) {
          isBlinking = true;
          blinkMarkTime = millis();
        } else if (isBlinking && millis() > blinkMarkTime + blinkDuration) {
          isBlinking = false;
        }
    
        if (isBlinking) {
          faceCurrent = face04; // blink with happy expression
        } else {
          faceCurrent = face03; // happy expression
        }   
      } 
      //No longer bothered
      else if (!isBothered && millis() > botheredMarkTime + botheredTimeout/6) {
        faceCurrent = face01; // neutral expression
      }
    
      if (isBothered || isHunting) {
        position = position.lerp(target, movementSpeed).add(new PVector(random(-botheredSpread, botheredSpread), random(-botheredSpread, botheredSpread)));
      }
      
      //At prey pos
      if (isHunting && position.dist(target) < 5) {
        //Caught prey
        if(prey != null){
          prey.isAlive = false;
          hunger += prey.sizeX * (1.0f/2.0f);
          changeSize((int)(sizeX * 1.5f), (int)(sizeY * 1.5f));
          prey = null;
          pickEscapeTarget();
        }
        //Prey is already dead?
        else{
          prey = null;
          pickEscapeTarget();
        }
        
        isHunting = false;
      }
      
      //Is hunger, start hunting
      if(hunger < hungerTolerance){
        pickEatTarget();
      }
      
      position.y += sin(millis()) / 2;
    }
  }
  
  void draw() {   
    if(isAlive){
      ellipseMode(CENTER);
      rectMode(CENTER);
      imageMode(CENTER);
    
    
      image(faceCurrent, position.x, position.y);
    
      if (debug) {
        noFill();
        stroke(0, 255, 0);
        ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
        ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
        line(target.x, target.y, position.x, position.y);
        stroke(255, 0, 0);
        rect(target.x, target.y, 10, 10);
      }
    }
  }
  
  void run() {
    update();
    draw();
  }
  
  void changeSize(int newX, int newY){
    sizeX = newX;
    sizeY = newY;
    
    face01.resize(newX, newY);
    face02.resize(face01.width, face01.height);
    face03.resize(face01.width, face01.height);
    face04.resize(face01.width, face01.height);
  }
  
  void pickEscapeTarget() {
    target = new PVector(random(margin, width-margin), random(margin, height-margin));
  }
  
  public void pickEatTarget(){
    if(!isHunting){
      for(int i = 0; i < creatures.length; i++){
        if(creatures[i].ID != this.ID && creatures[i].isAlive && creatures[i].sizeX < (sizeX * (3.0f/4.0f))){
          target = creatures[i].position;
          prey = creatures[i];
          isHunting = true;
          break;
        }
      }
    }
  }
  
  public float getHunger(){
    return hunger;
  }
  
}
