PImage img;
ArrayList<Dot> dots;
float dotSpeed = 0.005f;
int scaler = 2; // will use only every 2nd pixel from the image
int threshold = 200;
color col1, col2;
boolean imageToggled = false;

void setup(){
  size(800,600,P2D);
  
  //Load Image
  img = loadImage("welcome.png");
  
  //Load pixels
  img.loadPixels();
  
  col1 = color(255, 127, 0, 63);
  col2 = color(0, 127, 255, 63);
  
  dots = new ArrayList<Dot>();
  
  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      int loc = x + y * img.width;
      
      if (brightness(img.pixels[loc]) > threshold) {
        //int targetIndex = int(random(0, targets2.size()));
        //targets.add(new PVector(x, y));
        Dot dot = new Dot(x, y, col1, dotSpeed);
        dots.add(dot);
      }
    }
  }
  
  println(dots.size());
}

void draw(){
  background(0);
  
  blendMode(ADD);
  
  for (Dot dot : dots) {
    if(isMouseDown){
      dot.setTarget(mouseX,mouseY);
      dot.reSetSpeed();
    }
    else{
      dot.setTargetOrgPos();
      dot.reSetSpeed();
    }
    
    dot.run();
  }
  img.updatePixels();
  //image(img,150,0);
}

void setDotsToRandomPosition(){
  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      int loc = x + y * img.width;
      
      if (brightness(img.pixels[loc]) > threshold) {
        //int targetIndex = int(random(0, targets2.size()));
        //targets.add(new PVector(x, y));
        Dot dot = new Dot(x, y, col1, dotSpeed);
        dots.add(dot);
      }
    }
  }
}
