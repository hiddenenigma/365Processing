class Pattern {
  PVector loc;
  
  Pattern() {
    rectMode(CENTER);
    noStroke();
  }

  void display(float x, float y, float len) {
    if (len >= 1) {
      stroke(0);
      line(x, y, x+len/2, y);
      y += 20;
      display(x - len/2, y, len/2);     
      display(x + len/2, y, len/2);
      display(x, y + len/2, len/2);
      display(x, y - len/2, len/2);
      display(x, y, len/2);
    }
  }  
}
