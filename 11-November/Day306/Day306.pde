/* Source Cited

  Toxiclibs Library Example by Karssten Schmidt
  PolarUnravel

*/

import toxi.geom.*;
import toxi.math.*;
import processing.opengl.*;

float transition;

InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float l = 0;
float theta2 = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  stroke(0);
  strokeWeight(1);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(theta2);

  Vec2D normUp = new Vec2D(0, -1);
  for (int i = 0; i < 360; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(10, theta);
    float len = noise(polar.y * l) * r;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);
    line(circ.x, circ.y, circ.x + dir.x, circ.y + dir.y);
  }
  r -= 0.3;
  l += 0.01;
  theta2 += 0.001;
}

