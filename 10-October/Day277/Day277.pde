import processing.opengl.*;

ArrayList<Circle> circles;
PVector loc;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  noFill();
  rectMode(CENTER);
  loc = new PVector(0, 0);
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 350; i+= 5) {
    circles.add(new Circle(i,i));
  } 
}

void draw() {
//  saveFrame("output/frame####.png");
  if(frameCount == 600) {
    exit();
  }
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  for (Circle c: circles) {
    c.display();
  }
  popMatrix();
}

