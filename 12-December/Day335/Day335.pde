import toxi.geom.*;
import processing.opengl.*;
import peasy.*;

PeasyCam cam;

ArrayList<Line> lines;
float s = 0.3;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  cam = new PeasyCam(this, 200);
  smooth(8);
  strokeWeight(25);

  lines = new ArrayList<Line>();
  for (int i = 0; i < 600; i += 7) {
    Vec2D polar = new Vec2D(i, radians(i));
    Vec2D circ = polar.copy().toCartesian();
    lines.add(new Line(i, radians(i), circ.x, circ.y));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  scale(s);
  for (Line l: lines) {
    l.run();
  }
  popMatrix();
}

