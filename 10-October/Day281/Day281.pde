import processing.opengl.*;
ArrayList<Circle> circles;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  circles = new ArrayList<Circle>();
  for (int i = -300; i < 300; i+= 5) {
    for (int j = -300; j < 300; j+= 5) {
      circles.add(new Circle(i, j, i/1.2, j));
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
  scale(0.9);
  for (Circle c : circles) {
    c.display();
  }
  popMatrix();
}

