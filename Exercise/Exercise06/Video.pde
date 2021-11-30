import processing.video.*;

Capture capture;
int videoWidth = 320;
int videoHeight = 240;
int videoFps = 30;
PGraphics buffer;

void setupCapture(int whichCamera) {
  String[] cameraNames = Capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  
  if(cameraNames.length > 0){
    capture = new Capture(this, videoWidth, videoHeight, cameraNames[whichCamera], videoFps); 
  }
  else{
    //try and find some video source, this helps for usb cameras
    capture = new Capture(this,videoWidth,videoHeight,"pipeline:autovideosrc",videoFps);
  }
      
  buffer = createGraphics(videoWidth, videoHeight, P2D);
  
  capture.start();
}

void captureEvent(Capture c) {
  c.read();
  
  armUpdateOpenCV = true;
}
