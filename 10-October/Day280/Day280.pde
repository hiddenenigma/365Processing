import processing.opengl.*;
ArrayList<Circle> circles;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();

  circles = new ArrayList<Circle>();
  for (int i = -400; i < 405; i+= 2) {
    for (int j = -400; j < 405; j+= 2) {
      circles.add(new Circle(i,j,i/2,i));
    }
  } 
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
    exit();
  }
  background(0);

  pushMatrix();
  translate(width/2, height/2);
//  scale(1.2);
  for (Circle c: circles) {
    c.display();
  }
  popMatrix();
}

