import processing.opengl.*;
ArrayList<Circle> circles;

void setup() {
  size(500,500, OPENGL);
  smooth(8);
  noStroke();
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 400; i+= 15) {
    circles.add(new Circle(i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  for (Circle c: circles) {
    c.display();
  }
  if(frameCount == 600) {
    exit();
  }
}
