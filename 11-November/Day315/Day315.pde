import toxi.geom.*;
import processing.opengl.*;

ArrayList<Line> lines;
float s = 0.23;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  lines = new ArrayList<Line>();
  for (int i = 0; i < 600; i += 1) {
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
  s+= 0.0001;
  t+= 0.002;

}

