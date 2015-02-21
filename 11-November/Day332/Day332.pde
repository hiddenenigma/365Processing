import toxi.geom.*;
import processing.opengl.*;

ArrayList<Line> lines;
float s = 1;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  strokeWeight(3);
  lines = new ArrayList<Line>();
  for (int i = 0; i < 400; i += 1) {
    Vec2D polar = new Vec2D(1, radians(i));
    Vec2D circ = polar.copy().toCartesian();
    lines.add(new Line(i, radians(i), circ.x, circ.y));
  }
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(0);
  
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  for (Line l: lines) {
    l.run();
  }
  popMatrix();
  
  t+= 0.5;
}

