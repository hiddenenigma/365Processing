/* Source Cited:
  
  Toxiclibs Library Example by Karsten Scmidt
  PolarUnravel

*/

import toxi.geom.*;
import toxi.math.*;

float transition;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float theta2 = radians(45);

void setup() {
  size(500,500,P3D);
  noFill();
  stroke(0);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  scale(0.75);
  rotate(theta2);
  Vec2D normUp = new Vec2D(0, -1);
  for(int i = 0; i < 500; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(i,theta);
    float len = noise(polar.y + r) * i;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition,is).normalizeTo(len);
    line(circ.x+len, circ.y+len,  dir.x+circ.x,  dir.y+circ.y);
  }
  r+=0.015;
  theta2 += 0.025;
}

