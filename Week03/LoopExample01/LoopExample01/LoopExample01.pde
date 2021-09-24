PImage img;

void setup(){
  size(640,480,P2D);
  //Place image in data folder of file .pde
  img = loadImage("eye.png");
  //frameRate(144);
}


void draw(){
  background(127,0,127);
  
  for(int i = 0; i < 10; ++i){
   //ellipse(0 + (20  * i),0+ (20  * i),10,10);
   //tint(255,0,0,127);
   image(img,random(width), random(height), img.width/2, img.height/2); 
  }
}
