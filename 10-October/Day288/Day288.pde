import processing.opengl.*;
ArrayList<Circle> circles;
float s = 0.1;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  noFill();
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 500; i+= 1) {
    circles.add(new Circle(i, i, i/2, i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  scale(0.2);
  for (Circle c : circles) {
    c.display();
  }
  popMatrix();
}

