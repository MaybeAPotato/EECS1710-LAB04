int numCreatures = 10;

int creatureStartMinSize = 10;
int creatureStartMaxSize = 100;

float creatureStartMinHunger = 50.0f;
float creatureStartMaxHunger = 100.0f;

Creature[] creatures = new Creature[numCreatures];

void setup() { 
  size(800, 600, P2D);
  
  for (int i=0; i<creatures.length; i++) {
    creatures[i] = new Creature(random(width), random(height), int(random(creatureStartMinSize,creatureStartMaxSize)), random(creatureStartMinHunger,creatureStartMaxHunger), i);
  }
  
  //creatures[0] = new Creature(random(width), random(height), 100, 30, 0);
  //creatures[1] = new Creature(random(width), random(height), 50, 100, 1);
}

void draw() {
  background(127); 
  for (int i=0; i<creatures.length; i++) {
    creatures[i].run();
  }
  
}
