
import toxi.geom.*;
import processing.opengl.*;

ArrayList<Ring> rings;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  stroke(0, 35);
  rings = new ArrayList<Ring>();
  for (int i = 0; i < 750; i += 50) {
    rings.add(new Ring(i/2, i/2));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  for (Ring r : rings) {
    r.display();
  }
  popMatrix();
}

