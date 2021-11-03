ModularAlphabet ma;

void setup(){
  size(800,600,P2D);
  
  ma = new ModularAlphabet();
}

void draw(){
  background(255);
  
  ma.run();
}
