import toxi.geom.*;
import toxi.math.*;
import processing.opengl.*;

float transition;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float p = 0;
float s = 0.1;
float theta2 = radians(45);
Vec2D normUp = new Vec2D(0, -1);

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  scale(s);
  rotate(theta2);
  for (int i = 0; i < r; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(i, theta);
    float len = noise(polar.y + p) * 100;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);
    
    if (i%2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    
    ellipse(circ.x+len, circ.y+len, circ.x+circ.y, circ.y+circ.x);
  }
  r+=1;
  s+= 0.0001;
  p+= 0.001;
  theta2 += 0.001;
}

