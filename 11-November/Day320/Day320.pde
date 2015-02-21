/* Source Cited:
  
  Toxiclibs Library Example by Karsten Scmidt
  PolarUnravel

*/

import toxi.geom.*;
import toxi.math.*;

float transition;

InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;

void setup() {
  size(500,500,P3D);
  noFill();
  stroke(0,25);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(radians(45));
  
  Vec2D normUp = new Vec2D(0, -1);
  for(int i = 0; i < 360*2; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(r+450,theta);
    float len = noise(polar.y / r*100) * r;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition,is).normalizeTo(len);
    ellipse(circ.x/circ.y*2.2, circ.y/circ.x*2.2, circ.x + dir.x, circ.y + dir.y);
  }
  r+=0.05;
}

