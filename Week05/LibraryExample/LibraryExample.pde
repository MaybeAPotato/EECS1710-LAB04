import gifAnimation.*;

Gif gif;

void setup(){
 size(800,600,P2D);
 gif = new Gif(this,"mega_man.gif");
 gif.loop();
 gif.play();
}

void draw(){
  background(127);
  
  imageMode(CENTER);
  image(gif,mouseX,mouseY,64,64);
  
  if(mousePressed){
    gif.jump(0);
  }
}

void keyPressed(){
  if(gif.isPlaying()){
    gif.stop();
  }
  else{
    gif.play();
  }
}
