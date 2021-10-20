AnalogClock ac;
ProgressClock pc;



void setup() {
  size(800, 600, P2D); 
  ac = new AnalogClock(); 
  pc = new ProgressClock();
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  background(127);
  //ac.run();
  pc.run();
  
  
  String timestring = h + " h " + m + " m " + s + " s";
  
  textSize(32);
  fill(127,0,0);
  text(timestring,width/2,height - 20);
}
