class hLine {
  PVector loc;
  PVector loc2;
  PVector vel;
  PVector vel2;
  float weight;
  float c;

  
  hLine(float y, float y2, float move, float move2, float weight_, float c_) {
    loc = new PVector(0, y);
    loc2 = new PVector(500, y2);
    vel = new PVector(0, move);
    vel2 = new PVector(0, move2);
    weight = weight_;
    c = c_;
  }
  
  void run() {
    update();
    display();
    checkEdges();
  }
  
  void update() {
    loc.add(vel);
    loc2.add(vel2);
  }
  
  void display() {
    strokeWeight(weight);
    stroke(c);
    line(loc.x, loc.y, loc2.x, loc2.y);
  }
  
    void checkEdges() {

    if (loc.y > height) {
      vel.y *= -1;
      loc.y = height;
    } else if (loc.y < 0) {
      vel.y *= -1;
      loc.y = 0;
    }
    
    if (loc2.y > height) {
      vel2.y *= -1;
      loc2.y = height;
    } else if (loc2.y < 0) {
      vel2.y *= -1;
      loc2.y = 0;
    }
  }
}
