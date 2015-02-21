import processing.opengl.*;

ArrayList<Circle> circles;
float s = 0.1;
float ang;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  noFill();
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 3295; i+= 1) {
    circles.add(new Circle(i, i, i/2, i/2));
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  pushMatrix();
  translate(width/2, height/2);
  scale(0.1);
  for (Circle c : circles) {
    c.display();
  }
  popMatrix();
  ang+= 0.01;
}

