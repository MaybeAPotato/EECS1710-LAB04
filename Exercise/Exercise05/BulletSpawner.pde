class BulletSpawner{
  ArrayList<Bullet> bullets;
  float spawnXOffset = 30.0f;
  
  BulletSpawner(){
    bullets = new ArrayList<Bullet>();
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
    //Spawn a set of bullets every now and then
    if(random(1) < 0.2){
      for(int i = 0; i < random(3); i++){
        Bullet p;
        //Spawn right
        if(random(1) < 0.5){
          p = new Bullet(width - spawnXOffset,random(height),30,5);
          p.box.body.setLinearVelocity(new Vec2(-50, 0));
        }
        //Spawn left
        else{
          p = new Bullet(spawnXOffset,random(height),30,5);
          p.box.body.setLinearVelocity(new Vec2(50, 0));
        }  
        bullets.add(p);
      }
    }
    
    for(Bullet b : bullets){
      b.update();
    }
  }
  
  void draw(){
    for(Bullet b : bullets){
      b.draw();
    }
  }
}
