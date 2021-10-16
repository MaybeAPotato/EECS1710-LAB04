class Object{
  PVector position;
  PVector rotation;
  PVector scale;
  
  String name;
  
  Object(){
    position = new PVector(0,0,0);
    rotation = new PVector(0,0,0);
    scale = new PVector(0,0,0);
    name = "";
  }
  
  Object(PVector pos, PVector rot, PVector sca, String n){
    position = pos;
    rotation = rot;
    scale = sca;
    name = n;
  }
}
