
import toxi.geom.*;
import toxi.math.*;
import processing.opengl.*;

float transition;
InterpolateStrategy is=new SigmoidInterpolation(3);
float r = 0;
float p = 0;
float s = 1.4;
Vec2D normUp = new Vec2D(0, -1);

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noStroke();
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  rotate(radians(45));
  for (int i = 0; i < r+2000; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(1, theta);
    float len = noise(polar.y + p) * i;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);
    
    if (i%2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    
    ellipse(circ.x/len, circ.y+len, circ.x+dir.x, circ.y+dir.y);
    ellipse(circ.x+len, circ.y/len, circ.x+dir.x, circ.y+dir.y);
    ellipse(circ.x-len, circ.y/len, circ.x+dir.x, circ.y+dir.y);
    ellipse(circ.x/len, circ.y-len, circ.x+dir.x, circ.y+dir.y);
  }
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  for (int i = 0; i < r+2000; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(1, theta);
    float len = noise(polar.y + p) * i;
    Vec2D circ = polar.copy().toCartesian();
    Vec2D dir = circ.getNormalized();
    dir.interpolateToSelf(normUp, transition, is).normalizeTo(len);
    
    if (i%2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    
    ellipse(circ.x/len, circ.y+len, circ.x+dir.x, circ.y+dir.y);
    ellipse(circ.x+len, circ.y/len, circ.x+dir.x, circ.y+dir.y);
    ellipse(circ.x-len, circ.y/len, circ.x+dir.x, circ.y+dir.y);
    ellipse(circ.x/len, circ.y-len, circ.x+dir.x, circ.y+dir.y);
  }
  popMatrix();
  
  r+=1;
  s+= 0.0001;
  p+= 0.005;
}

