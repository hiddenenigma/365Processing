class Square {
  PVector loc1;
  PVector loc2;
  PVector loc3;
  PVector loc4;
  PVector vel1;
  PVector vel2;
  PVector vel3;
  PVector vel4;
  float c;
  float d;
  
  Square(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float c_, float d_) {
    loc1 = new PVector(x1, y1);
    loc2 = new PVector(x2, y2);
    loc3 = new PVector(x3, y3);
    loc4 = new PVector(x4, y4);
    vel1 = new PVector(random(-1,1), random(-1,1));
    vel2 = new PVector(random(-1,1), random(-1,1));
    vel3 = new PVector(random(-1,1), random(-1,1));
    vel4 = new PVector(random(-1,1), random(-1,1));
    c = c_;
    d = d_;
  }
  
  void run() {
    update();
    display();
    checkEdges();
  }
  
  void update() {
    loc1.add(vel1);
    loc2.add(vel2);
    loc3.add(vel3);
    loc4.add(vel4);
  }
  
  void display() {
    beginShape();
    noFill();
    stroke(c);
    strokeWeight(0.1);
    vertex(loc1.x,loc1.y);
    vertex(loc2.x,loc2.y);
    vertex(loc3.x,loc3.y);
    vertex(loc4.x,loc4.y);
    endShape(CLOSE);
    fill(255);
    noStroke();
    ellipse(loc1.x, loc1.y, d, d);
    ellipse(loc2.x, loc2.y, d, d);
    ellipse(loc3.x, loc3.y, d, d);
    ellipse(loc4.x, loc4.y, d, d);
    d+= 0.02;
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
    
    if (loc3.x > width) {
      loc3.x = width;
      vel3.x *= -1;
    } else if (loc3.x < 0) {
      vel3.x *= -1;
      loc3.x = 0;
    }
    if (loc3.y > height) {
      loc3.y = height;
      vel3.y *= -1;
    } else if (loc3.y < 0) {
      vel3.y *= -1;
      loc3.y = 0;
    }
    
    if (loc4.x > width) {
      loc4.x = width;
      vel4.x *= -1;
    } else if (loc4.x < 0) {
      vel4.x *= -1;
      loc4.x = 0;
    }
    if (loc4.y > height) {
      loc4.y = height;
      vel4.y *= -1;
    } else if (loc4.y < 0) {
      vel4.y *= -1;
      loc4.y = 0;
    }
  }
}
