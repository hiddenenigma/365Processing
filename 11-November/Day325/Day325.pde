import toxi.geom.*;
import toxi.math.*;

float transition;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float s = 1;
float theta2 = radians(45);
Vec2D normUp = new Vec2D(0, -1);

void setup() {
  size(500, 500, P3D);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(theta2);
  
  for (int i = 0; i < 360*2; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(i, theta);
    float len = noise(polar.y + r) * i;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);
    
    if (i%2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    
    ellipse(circ.x/1.5, circ.y/1.5, circ.x+dir.x, circ.y+dir.y);
  }
  
  r+=0.01;
  s-= 0.0001;
  theta2 += 0.002;
}

