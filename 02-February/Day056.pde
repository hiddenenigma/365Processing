/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 3: Oscillation
*/

Line [] lines = new Line[100];

void setup() {
  size(500, 500);
  smooth();
  background(255);

  for (int i = 0; i < lines.length; i ++) {
    lines[i] = new Line(random(-400, 400), random(-400, 400));
  }
}

void draw() {

  //  saveFrame("output/frames#################.tif");
  for (int i = 0; i < lines.length; i++) {
    lines[i].update();
    lines[i].display();
  }
}

class Line {
  PVector location;
  PVector velocity;
  float angle = 0;
  float aVelocity = 0.001;
  float t = 0;


  Line(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
  }

  void update() {
    location.add(velocity);
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;
    float n = noise(t);
  }

  void display() {
    if (mousePressed == true) {
      stroke(255, 20);
    } else {
      stroke(0, 20);
    }
    strokeWeight(0.001);
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle);
    line(location.x, location.y, 0, 0);
    t += 0.01;
    popMatrix();
  }
}

