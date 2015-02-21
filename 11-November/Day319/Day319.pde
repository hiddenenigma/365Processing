import toxi.geom.*;
import toxi.math.*;
import processing.opengl.*;

ArrayList<Line> lines;
float s = 1;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  lines = new ArrayList<Line>();
  for (int i = 0; i < 500; i += 2) {
    lines.add(new Line(i, i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(t);
  scale(s);
  for(Line l: lines) {
    l.display();
  }
  popMatrix();
  s+= 0.0004;
  t+= 0.002;
}

