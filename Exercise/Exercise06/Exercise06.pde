PVector cameraPos;
ArrayList<PImage> captureImages;
ArrayList<PVector>imagePos;
boolean captureNewImage = true;

void setup() {
  size(640, 480, P2D);
  cameraPos = new PVector(width, 0, 100);
  setupCapture(0);
  setupOpenCV();
  
  captureImages = new ArrayList<PImage>();
  imagePos = new ArrayList<PVector>();
}

void draw() {
  scale(2);
  background(0);
  updateOpenCV();

  image(buffer, 0, 0 );

  noFill();


  for (int i=0; i<faces.length; i++) {
    Rectangle face = faces[i];
    stroke(0, 255, 0);
    strokeWeight(3);
    rect(face.x, face.y, face.width, face.height);
  }

  surface.setTitle("" + frameRate);

  text(isKeyDown ? "true" : "false", 0, 10);
  text("Push space to capture face image", 0, 40);

  if (isKeyDown) {
    text(keyNum, 0, 25);
  }
  
  if(isKeyDown && captureNewImage && keyNum == 32){
    //Capture image
    Rectangle face = new Rectangle();
    for (int i=0; i<faces.length; i++) {
      face = faces[i];
      stroke(0, 0, 255);
      strokeWeight(3);
      rect(face.x, face.y, face.width, face.height);
    }
    
    loadPixels();
    capture.loadPixels();
    
    PImage deFace = createImage(capture.width,capture.height,ARGB);
    deFace.loadPixels();
    
    for (int x = face.x; x < face.x + face.width; x++) {
      for (int y = face.y; y < face.y + face.height; y++) {
        // Calculate the 1D location from a 2D grid
        int loc = x + y * capture.width;
        
        // Get the red, green, blue values from a pixel
        float r = red  (capture.pixels[loc]);
        float g = green(capture.pixels[loc]);
        float b = blue (capture.pixels[loc]);
  
        // Make a new color and set pixel in the window
        color c = color(r, g, b);
        deFace.pixels[loc] = c;
      }
    }
    deFace.updatePixels();
    capture.updatePixels();
    updatePixels();
    
    captureImages.add(deFace);
    imagePos.add(new PVector(face.x,face.y));
    
    captureNewImage = false;
  }
  
  if(isKeyDown == false && captureNewImage == false){
    captureNewImage = true;
  }
  
  for(int i = captureImages.size()-1; i> 0; --i){ 
    image(captureImages.get(i),imagePos.get(i).x,imagePos.get(i).y);
  }
}
