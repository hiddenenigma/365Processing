import toxi.geom.*;
import processing.opengl.*;

ArrayList<Ring> rings;
float s = 0.37;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  noStroke();
  rings = new ArrayList<Ring>();
  for (int i = 0; i < 360*3; i += 5) {
    Vec2D polar = new Vec2D(1, radians(i));
    Vec2D circ = polar.copy().toCartesian();
    rings.add(new Ring(i, i, circ.x, circ.y));
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  for(Ring r: rings) {
    r.run();
  }
  popMatrix();
  s+= 0.0005;
}

