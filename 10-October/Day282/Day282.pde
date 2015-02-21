import processing.opengl.*;
ArrayList<Circle> circles;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  noFill();
  circles = new ArrayList<Circle>();
  for (int i = 0; i < width; i+= 7) {
    for (int j = 0; j < height; j+= 7) {
      circles.add(new Circle(i, i, i, j));
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
  scale(1.6);
  for (Circle c : circles) {
    c.display();
  }
  popMatrix();
}

