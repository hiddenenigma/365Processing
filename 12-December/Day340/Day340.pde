import processing.opengl.*;

ArrayList<Line> lines;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  strokeWeight(5);
  lines = new ArrayList<Line>();
  for (int i = 0; i < 800; i+= 15) {
    lines.add(new Line(i));
  }
}

void draw() {
  //  saveFrame("output/frame####.png");
  background(255);
  for (Line l: lines) {
    l.display();
  }
}

