float rot1 = hour();
float rot2 = minute();
float rot3 = second();

float lengthHourHand = 200.0f;
float lengthMinuteHand = 100.0f;
float lengthSecondHand = 50.0f;

void setup(){
  size(800,600, P2D);
}

void draw(){
  background(127);
  
  ellipse(width/2,height/2,500,500);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rot1));
  line(0, 0, lengthHourHand, 75);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(rot2));
  line(0,0,lengthMinuteHand,75);
  popMatrix();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(rot3));
  line(0,0,lengthSecondHand,75);
  popMatrix();
  
  println(hour() + "h " + minute() + "m "+ second() +"s ");
}
