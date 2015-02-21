import toxi.geom.*;
import processing.opengl.*;

ArrayList<Ring> rings;
float s = 1;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  noStroke();
  rings = new ArrayList<Ring>();
  for (int i = 0; i < 500; i += 1) {
    Vec2D polar = new Vec2D(1, radians(i));
    Vec2D circ = polar.copy().toCartesian();
    rings.add(new Ring(i, radians(i), circ.x, circ.y));
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
  t+= 1;
}

