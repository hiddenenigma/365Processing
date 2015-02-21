/* Source Cited

  Toxiclibs Library Example by Karssten Schmidt
  PolarUnravel

*/


import toxi.geom.*;
import toxi.math.*;
import processing.opengl.*;

float transition, transTarget;

InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float theta = 0;

void setup() {
  size(500,500,OPENGL);
  noFill();
}

void draw() {
//  saveFrame("output/frame####.png");
  
  background(255);
  translate(width/2, height/2);
  rotate(theta);
  
  Vec2D normUp = new Vec2D(0, -1);
  for(int i = 270; i < 360 + 270; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(r,theta);
    float len = noise(polar.y / r*250) * 100;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition,is).normalizeTo(len);
    stroke(0,75);
    ellipse(circ.x, circ.y, circ.x + dir.x, circ.y + dir.y);
  }
  r+=0.1;
  theta += 0.001;
}

