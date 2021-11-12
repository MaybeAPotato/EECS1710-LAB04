class Pet{
  PVector pos;
  float w,h;
  Box petBox;
  
  Pet(float _x, float _y, float _w, float _h){
    w = _w;
    h = _h;
    
    pos = new PVector();
    pos.x = _x;
    pos.y = _y;
    
    petBox = new Box(_x,_y,w,h);
  }
  
  
  void run(){
    update();
    draw();
    
    petBox.run();
  }
  
  void update(){
  }
  
  void draw(){
    
  }
  
  
  
  
}
