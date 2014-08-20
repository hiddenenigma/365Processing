class Square {
  PVector loc;
  PVector vel;
  float r;
  
  Square(float x, float y) {
    loc = new PVector(x,y);
    vel = new PVector(random(-2,2), 0);
  }
  
  void run() {
    update();
    display();
    checkEdges();
  }
  
  void update() {
    loc.add(vel);
    noStroke();
    color c = color(r);
    r = noise(frameCount * 0.01) * 255;
    fill(c);
  }
  
  void display() {
    rect(loc.x, loc.y,5,5);
  }
  
  void checkEdges() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    } else if (loc.x < 0) {
      vel.x *= -1;
      loc.x = 0;
    }
  }
}
    
