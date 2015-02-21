class Pattern {
  PVector loc;
  PVector vel;
  
  Pattern() {
    rectMode(CENTER);
    noStroke();
  }

  void display(float x, float y, float r, int l) {
    loc = new PVector(x,y);
    vel = new PVector(random(-0.5,0.5), random(-0.5,0.5));
    loc.add(vel);
    float tt = 255 * l/7;
    fill(random(tt));
    rect(loc.x, loc.y, r, r);
    fill(255);
    rect(loc.x, loc.y, 2, 2);
    if (l > 1) {
      l = l - 1;
      display(x - r/2, y, r/2, l);     
      display(x + r/2, y, r/2, l);
      display(x, y + r/2, r/2, l);
      display(x, y - r/2, r/2, l);
      display(x, y, r/2, l);
    }
  }  
}
