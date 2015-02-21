
import toxi.geom.*;
import processing.opengl.*;

ArrayList<Line> lines;
float s = 0.5;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  lines = new ArrayList<Line>();
  for (int i = 0; i < 500; i += 1) {
    lines.add(new Line(i*2, i));
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
  s-= 0.0005;
  t+= 0.002;
}

