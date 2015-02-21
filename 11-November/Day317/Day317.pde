import toxi.geom.*;
import processing.opengl.*;

ArrayList<Ring> rings;
float s = 0.35;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  rings = new ArrayList<Ring>();
  for (int i = 0; i < 600; i += 5) {
    rings.add(new Ring(i*2, i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(t);
  scale(s);
  for(Ring r: rings) {
    r.display();
  }
  popMatrix();
  s+= 0.0005;
  t+= 0.002;
}

