Circle [] circles = new Circle[30];

void setup() {
  size(500, 500);
  background(255);

  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(-10, 2), random(-10, 250), random(0.1, 3), 0, random(-10, 10));
  }
}

void draw() {

  //  saveFrame("output9/frames#################.tif");
  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
  }
}

class Circle {
  float theta;
  float loc;
  float mass;
  float alpha;
  float random;

  Circle(float t, float l, float m, float a, float r) {
    theta = t;
    loc = l;
    mass = m;
    alpha = a;
    random = r;
  }

  void display() {
    float r = noise(frameCount * 0.01) * loc;
    float x = r * cos(theta) + random;
    float y = r * sin(theta) + random;
    noStroke();
    fill(alpha);
    ellipse(x+width/2, y+height/2, mass, mass);
    theta += 0.01;
  }
}
