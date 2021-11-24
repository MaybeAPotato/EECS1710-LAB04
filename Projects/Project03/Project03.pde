ArrayList<PImage> img;
ArrayList<ArrayList<PVector>> targetsArray;
ArrayList<Dot> dots;
float dotSpeed = 0.005f;
int scaler = 2; // will use only every 2nd pixel from the image
int threshold = 200;
color col1, col2;
boolean imageToggled = false;

void setup(){
  size(800,600,P2D); //<>//
  
  img = new ArrayList<PImage>();
  targetsArray = new ArrayList<ArrayList<PVector>>();
  
  //Load Image
  img.add(loadImage("welcome.png"));
  img.add(loadImage("eggman1.png"));
  img.add(loadImage("eggman2.png"));
  
  for(int i = 0; i < img.size(); i++){
    targetsArray.add(new ArrayList<PVector>());
  }
  
  //Load pixels
  for(int i = 0; i < img.size(); i++)
    img.get(i).loadPixels();
    
    
  col1 = color(255, 127, 0, 63);
  col2 = color(0, 127, 255, 63);
  
  for(int i = 0; i < targetsArray.size(); i++){
    ArrayList<PVector> target = targetsArray.get(i);
    PImage image = img.get(i);
    
    for(int x = 0; x < image.width; x += scaler){
      for(int y = 0; y < image.height; y += scaler){
        // this translates x and y coordinates into a location in the pixels array
        int loc = x + y * image.width;

        if (brightness(image.pixels[loc]) > threshold) {
          target.add(new PVector(x, y));
        }
      }
    }
    
  }
  
  dots = new ArrayList<Dot>();
  
  //Initial pixel
  for (int x = 0; x < img.get(0).width; x += scaler) {
      for (int y = 0; y < img.get(0).height; y += scaler) {
        int loc = x + y * img.get(0).width;
      
        if (brightness(img.get(0).pixels[loc]) > threshold) {
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
    
    if(isMouseDown && dot.distanceToTarget() < 0.25f){
      ArrayList<PVector> randomVecs = targetsArray.get(int(random(0,img.size())));
      
      for(int i = 0; i < dots.size(); i++){
        if(i < randomVecs.size()){
          dots.get(i).setOriginalPos(randomVecs.get(i));
        }
      }
      
      
    }
    
    dot.run();
  }
  
  for(int i = 0; i < img.size(); i++){
    img.get(i).updatePixels();
  }
  //image(img,150,0);
}

void setDotsToRandomPosition(){
  //for (int x = 0; x < img.width; x += scaler) {
  //  for (int y = 0; y < img.height; y += scaler) {
  //    int loc = x + y * img.width;
      
  //    if (brightness(img.pixels[loc]) > threshold) {
  //      //int targetIndex = int(random(0, targets2.size()));
  //      //targets.add(new PVector(x, y));
  //      Dot dot = new Dot(x, y, col1, dotSpeed);
  //      dots.add(dot);
  //    }
  //  }
  //}
}
