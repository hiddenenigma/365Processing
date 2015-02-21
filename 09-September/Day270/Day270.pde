import processing.opengl.*;
ArrayList<Circle> circles;

void setup() {
  size(500,500);
  smooth(8);
  noStroke();
  fill(0);
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 500; i+= 5) {
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
