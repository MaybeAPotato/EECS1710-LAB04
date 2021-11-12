// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
Pet p;
Player thePlayer;
Boundary leftBoundary, rightBoundary;

void setup() {
  size(800, 600, P2D);  
  setupSound();
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // We are setting a custom gravity
  box2d.setGravity(0, -9.8f);
  
  leftBoundary = new Boundary(-1,height/2,1,height);
  rightBoundary = new Boundary(width+1,height/2,1,height);
  
  p = new Pet(width/2,0,64,64);
  thePlayer = new Player(width/2,height - 30,250,30);
}

void draw() {
  background(127);
  
  // We must always step through time!
  box2d.step();
  
  updateSound();
  
  p.run();
  thePlayer.run();
}

//Code taken from Nick's Artillery03
boolean hitDetectRect(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  
  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
}
