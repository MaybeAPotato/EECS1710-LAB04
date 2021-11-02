class EndLine{
  float endLineWidth = 3.0f;
  float endLineHeight = height;
  
  EndLine(){
  }
  
  void run(){
    update();
    draw();
  }
  
  void update(){
  
  }
  
  void draw(){
    fill(255,0,0);
    rectMode(CENTER);
    rect(endLinePos.x,endLinePos.y,endLineWidth,endLineHeight);
  }
}
