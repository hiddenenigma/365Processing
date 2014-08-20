class hLine {
  PVector loc;
  PVector loc2;
  PVector vel;
  PVector vel2;
  float size;
  float weight;
  
  hLine(float y, float y2, float move, float move2, float weight_) {
    loc = new PVector(0, y);
    loc2 = new PVector(500, y2);
    vel = new PVector(0, move);
    vel2 = new PVector(0, move2);
    weight = weight_;
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
    stroke(0);
    beginShape();
    line(loc.x, loc.y, loc2.x, loc2.y);
  }
  
   void checkEdges() {

    if (loc.y > height + 10) {
      vel.y *= -1;
      loc.y = height + 10;
    } else if (loc.y < -10) {
      vel.y *= -1;
      loc.y = -10;
    }
    
    if (loc2.y > height + 10) {
      vel2.y *= -1;
      loc2.y = height + 10;
    } else if (loc2.y < -10) {
      vel2.y *= -1;
      loc2.y = -10;
    }
  }
}
