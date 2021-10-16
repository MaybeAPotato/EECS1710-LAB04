class AimThing{
  PVector pos1,pos2;
  PShape[] shp = new PShape[4];
  PVector[] corner = new PVector[4];

  int shpDiff = 13;
  
  AimThing(){    
    corner[0] = new PVector(0,0);
    corner[1] = new PVector(width,0);
    corner[2] = new PVector(width,height);
    corner[3] = new PVector(0,height);
    
    pos1 = new PVector(300,300);
    pos2 = new PVector(width, height);
    
    for(int i = 0; i < shp.length; i++){
      shp[i] = createShape();
      shp[i].beginShape();
      
      shp[i].stroke(127);
      shp[i].fill(255,0,0);
      
      shp[i].vertex(corner[i].x,corner[i].y);
      
      int valX = corner[i].x < width ? shpDiff : -shpDiff;
      int valY = corner[i].y < height ? shpDiff : -shpDiff;
      
      shp[i].vertex(corner[i].x + valX,corner[i].y);
      shp[i].vertex(width/2,height/2);
      shp[i].vertex(corner[i].x, corner[i].y + valY);
      
      shp[i].endShape();
    }
  }
  
  void update(){
    for(int i = 0; i < shp.length; i++){
      shp[i].setVertex(shp[i].getVertexCount()-2,mouseX,mouseY);
    }
  }
  
  void draw(){
    shapeMode(CORNER);
    
    for(int i = 0; i < shp.length; i++){
      shape(shp[i]);
    }
  }
  
  void run(){
    update();
    draw();
  }
}
