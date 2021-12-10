float mouseHeldDownTime = 0.0f;

void mouseDragged() {
  mouseHeldDownTime = mouseHeldDownTime < 255 ? mouseHeldDownTime+0.1f : 0;
  
  // add point based on width/height
  xy.line(mouseX, mouseY, pmouseX, pmouseY);
  xy.freq(mouseX * freqOffset,mouseY * freqOffset,50);
  
  if (strokes.size() > 0) {
    Stroke stroke = strokes.get(strokes.size()-1);
    stroke.points.add(new PVector(mouseX, mouseY));
    stroke.timestamp = millis();
  }

  marktime = millis();
}

void keyPressed() {
  if (keyCode == 8) { // DELETE
    xy.clearWaves();
  }
}

void mousePressed() {
  Stroke stroke = new Stroke();
  strokes.add(stroke);
}

void mouseReleased() {
  //
  freqOffset = random(0.0f,freqOffsetRandomRange);
}
