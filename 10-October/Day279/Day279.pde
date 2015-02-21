import processing.opengl.*;

ArrayList<Circle> circles;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 2500; i+= 15) {
    circles.add(new Circle(i/2,i));
  } 
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  scale(0.3);
  for (Circle c: circles) {
    c.display();
  }
  fill(0);
  popMatrix();
}

