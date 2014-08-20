class vLine {
  PVector loc;
  PVector loc2;
  PVector vel;
  PVector vel2;
  float weight; 
  float c;
  
  vLine(float x, float x2, float move, float move2, float weight_, float c_) {
    loc = new PVector(x, 0);
    loc2 = new PVector(x, 500);
    vel = new PVector(move, 0);
    vel2 = new PVector(move2, 0);
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

    if (loc.x > height) {
      vel.x *= -1;
      loc.x = height;
    } else if (loc.x < 0) {
      vel.x *= -1;
      loc.x = 0;
    }
    
    if (loc2.x > height) {
      vel2.x *= -1;
      loc2.x = height;
    } else if (loc2.x < 0) {
      vel2.x *= -1;
      loc2.x = 0;
    }
  }
}
