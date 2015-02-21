class Pattern {
  PVector loc;
  PVector vel;
  
  Pattern() {
    rectMode(CENTER);
    noFill();
  }

  void display(float x, float y, float r, float l) {
    loc = new PVector(x,y);
    vel = new PVector(random(-1,1), random(-1,1));
    loc.add(vel);
    fill(255);
    rect(loc.x,loc.y,5,r);
    float c = 255 * l/7;
    fill(c); 
    rect(loc.x, loc.y, r/2, r/2);
    rect(loc.x+r/2, loc.y, r/2, r/2);
    rect(loc.x-r/2, loc.y, r/2, r/2);
    rect(loc.x, loc.y+r/2, r/2, r/2);
    rect(loc.x, loc.y-r/2, r/2, r/2);    
    if (l > 1) {
      l = l - 1;
      display(x + r/2, y, r/2, l);
      display(x - r/2, y, r/2, l);
      display(x, y - r/2, r/2, l);
      display(x, y + r/2, r/2, l);
    }
  }  
}
