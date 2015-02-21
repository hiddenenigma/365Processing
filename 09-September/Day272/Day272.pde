import processing.opengl.*;
ArrayList<Circle> circles;
float angle=0;

void setup() {
  size(500,500, OPENGL);
  smooth(8);
  noStroke();
  rectMode(CENTER);
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 1155; i++) {
    circles.add(new Circle(i/2,i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  for (Circle c: circles) {
    c.display();
  }
  if(frameCount == 525) {
    exit();
  }
  popMatrix();
}
