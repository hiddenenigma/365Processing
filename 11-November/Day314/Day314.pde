
import toxi.geom.*;
import processing.opengl.*;

ArrayList<Ring> rings;
float s = 1;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
  rings = new ArrayList<Ring>();
  for (int i = 0; i < 750; i += 5) {
    rings.add(new Ring(i, i/2));
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(t);
  scale(s);
  for(Ring r: rings) {
    r.display();
  }
  popMatrix();
  s+= 0.001;
  t+= 0.01;
}

