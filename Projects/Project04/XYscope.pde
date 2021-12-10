import xyscope.*;
import ddf.minim.*; 

XYscope xy;
PVector xyscopeFreq;
PVector xyscopeFreqDefault;
float freqOffset = 1.0f;
int freqOffsetRandomRange = 3;

void setupXYscope() {
  // initialize XYscope with default sound out
  xy = new XYscope(this);
  xy.amp(0.10f,0.10f);
  xyscopeFreq = xy.freq(); //DEFAULT
  xyscopeFreqDefault = xyscopeFreq;
}

void setFreq(float x, float y, float z){
  xy.freq(x,y,z);
  xyscopeFreq = xy.freq();
}

void setFreq(PVector p){
  xy.freq(p);
  xyscopeFreq = xy.freq();
}

void setFreqDefault(){
  xy.freq(50,50,50);
  xyscopeFreq = xyscopeFreqDefault;
}

void updateXYscope() {
  // build audio from shapes
  xy.buildWaves();

  // draw all analytics
  xy.drawAll();
}
