class ImageObject extends Object{
  PImage img;
  
  ImageObject(String imgName, PVector pos, PVector rot, PVector sca){
    img = loadImage(imgName);
    
    name = imgName;
    
    position = pos;
    rotation = rot;
    scale = sca;
    
    img.resize(int(sca.x),int(sca.y));
    
  }
  
  void draw(){
    image(img,position.x,position.y);
  }
}
