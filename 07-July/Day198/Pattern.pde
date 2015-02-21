class Pattern {
  PVector loc;
  PVector vel;
  
  Pattern() {
    rectMode(CENTER);
    noFill();
  }

  void display(float x, float y, float len) {
    if (len >= 2) {
      stroke(0);
      line(x-len/3, y, x+len/3, y);
      line(x, y+len/3, x, y-len/3);
      display(x - len/3, y, len/3);  
      display(x + len/3, y, len/3);
      display(x, y + len/3, len/3);
      display(x, y - len/3, len/3);
      display(x, y, len/3);
    }
  }  
}
