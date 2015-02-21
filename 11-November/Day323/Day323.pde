import toxi.geom.*;
import toxi.math.*;

float transition;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float s = 1;
Vec2D normUp = new Vec2D(0, -1);

void setup() {
  size(500, 500, P3D);
  noFill();
  strokeWeight(5);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  scale(0.5);
  rotate(radians(45));
  
  for (int i = 0; i < 360*1; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(200, theta);
    float len = noise(polar.y + r) * i;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);
    if (i%2 == 0) {
      stroke(0);
    } else {
      stroke(255);
    }
    beginShape(LINES);
    vertex(circ.x+dir.x, circ.y+dir.y);
    vertex(circ.y+dir.y, circ.x+dir.x);
    endShape();
  }
  r+=0.01;
  s-= 0.0001;
}

