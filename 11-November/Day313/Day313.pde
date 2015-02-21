import toxi.geom.*;
import processing.opengl.*;

ArrayList<Ring> rings;
float s = 1;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  rings = new ArrayList<Ring>();
  for (int i = 0; i < 750; i += 5) {
    rings.add(new Ring(i/5, i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  for(Ring r: rings) {
    r.display();
  }
  popMatrix();
  s+= 0.001;
}

