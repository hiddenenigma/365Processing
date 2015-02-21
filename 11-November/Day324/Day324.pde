
import toxi.geom.*;
import toxi.math.*;

float transition;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float s = 1;
float theta2 = radians(45);

void setup() {
  size(500, 500, P3D);
  noFill();
  strokeWeight(10);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(theta2);
  Vec2D normUp = new Vec2D(0, -1);
  for (int i = 0; i < 360*2; i += 3) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(250, theta);
    float len = noise(polar.y + r) * i;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);

    if (i%2 == 0) {
      stroke(255);
    } else {
      stroke(0);
    }

    beginShape();
    vertex(i, dir.y);
    vertex(dir.x, i);
    vertex(-i, dir.y);
    vertex(dir.x, -i);
    endShape(CLOSE);
  }
  
  r+=0.01;
  s-= 0.0001;
  theta2 += 0.002;
}

