import toxi.geom.*;
import toxi.math.*;
import processing.opengl.*;

float transition, transTarget;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float p = 0;
float s = 1;
Vec2D normUp = new Vec2D(0, -1);

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  strokeWeight(10);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  scale(s);
  rotate(radians(45));
  for (int i = 0; i < r; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(i/10, theta);
    float len = noise(polar.y + p) * r;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);

    if (i%2 == 0) {
      stroke(255);
    } else {
      stroke(0);
    }

    rect(circ.x, circ.y, circ.x+dir.x, circ.y+dir.y);
  }
  
  r+=1;
  s+= 0.0001;
  p+= 0.001;
}

