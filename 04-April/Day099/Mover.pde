class Mover {
  PVector loc1;
  PVector loc2;
  PVector vel1;
  PVector vel2;
  PVector acc1;
  PVector acc2;
  float d;
  
  Mover() {
    loc1 = new PVector(width/2, height/2);
    loc2 = new PVector(width/2, height/2);
    vel1 = new PVector(random(-1,1), random(-1,1));
    vel2 = new PVector(random(-1,1), random(-1,1));
    acc1 = new PVector(random(-0.1,0.1), random(-0.1,0.1));
    acc2 = new PVector(random(-0.1,0.1), random(-0.1,0.1));
    d = 0;
  }
  
  void run() {
    update();
    display();
    checkEdges();
  }
  
  void update() {
    loc1.add(vel1);
    loc2.add(vel2);
    vel1.add(acc1);
    vel2.add(acc2);
  }
  
  void display() {
    strokeWeight(0.5);
    float dst = dist(loc1.x, loc1.y, loc2.x, loc2.y);
    if (dst < 500) {
      stroke(0, 255-dst);
      line(loc1.x,loc1.y, loc2.x, loc2.y);
      ellipse(loc1.x,loc1.y,d,d);
      ellipse(loc2.x,loc2.y,d,d);
    }
  }
  
  void checkEdges() {
    if (loc1.x > width) {
      loc1.x = width;
      vel1.x *= -1;
    } else if (loc1.x < 0) {
      vel1.x *= -1;
      loc1.x = 0;
    }
    if (loc1.y > height) {
      loc1.y = height;
      vel1.y *= -1;
    } else if (loc1.y < 0) {
      vel1.y *= -1;
      loc1.y = 0;
    }
    
     if (loc2.x > width) {
      loc2.x = width;
      vel2.x *= -1;
    } else if (loc2.x < 0) {
      vel2.x *= -1;
      loc2.x = 0;
    }
    if (loc2.y > height) {
      loc2.y = height;
      vel2.y *= -1;
    } else if (loc2.y < 0) {
      vel2.y *= -1;
      loc2.y = 0;
    }
  }
}
    
