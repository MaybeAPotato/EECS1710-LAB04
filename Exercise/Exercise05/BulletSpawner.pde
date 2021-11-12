class BulletSpawner{
  ArrayList<Box> bullets;
  float spawnXOffset = 30.0f;
  
  BulletSpawner(){
    bullets = new ArrayList<Box>();
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
    //Spawn a set of bullets every now and then
    if(random(1) < 0.2){
      for(int i = 0; i < random(3); i++){
        Box p;
        //Spawn left
        if(random(1) < 0.2){
          p = new Box(width + spawnXOffset,random(height),30,5);
        }
        else{
          p = new Box(-spawnXOffset,random(height),30,5);
        }  
        bullets.add(p);
      }
    }
  }
  
  void draw(){
  }
}
