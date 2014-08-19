Circle [] circles = new Circle[500];

void setup() {
  size(500, 500);
  frameRate(30);
  rectMode(CENTER);
    background(0);
    smooth();
  for (int i = 0; i < circles.length; i ++) {
    circles[i] = new Circle(random(10), random(-0.04, 0.04), random(width/2), random(height/2), random(255));
  }
}

void draw() {
//    saveFrame("output/frames#################.tif");

  for (int i = 0; i < circles.length; i ++) {
    circles[i].display();
  }

}

class Circle {
  PVector location;
  float angle = 0.00;
  float radius;
  float rotateAngle;
  float s = 0.0;
  float randomFill;

  Circle(float rad, float r, float x, float y, float f) {
    location = new PVector(x, y);
    radius = rad;
    rotateAngle = r;
    randomFill = f;
  }
  
  void update() {
     s = cos(0.7)*1.5;

  }

  void display() {
    fill(randomFill);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    scale(.55);

    ellipse(location.x, location.y, radius, radius);
    angle += rotateAngle + random(-0.1,0.1);
    popMatrix();
  }
}
    
