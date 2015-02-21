/* Source Cited:
 
 Generative Art: A Practical Guide Using Processing by Matt Pearson
 Page 99 - 5.3.3 The wrong way to draw a sphere
 
*/

import processing.opengl.*;
import peasy.*;

PeasyCam cam;

float radius = 100;
float xnoise, ynoise, znoise, xstart, ystart, zstart;
float inc;

void setup() {
  size(500, 500, OPENGL);
  background(255);
  noStroke();
  cam = new PeasyCam(this,600);
  xstart = random(10);
  ystart = random(10);
  zstart = random(10);
}
void draw() {
//  saveFrame("output/frames####.tif");

  background(255); 
  rotateX(frameCount * 0.01); 
  rotateY(frameCount * 0.01);
  rotateZ(frameCount * 0.01);

  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  xstart += 0.003;
  ystart += 0.003;
  zstart += 0.003;
  xnoise = xstart;
  ynoise = ystart;
  znoise = zstart;
  while (t < 1+inc) {
    s += xnoise;
    t += 0.025;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius * cos(radianS) * sin(radianT));
    float thisy = 0 + (radius * sin(radianS) * sin(radianT));
    float thisz = 0 + (radius * cos(radianT)); 
    if (lastx != 0) {
      stroke(0);
      strokeWeight(1);
      xnoise+=0.0001;
      drawPoint(thisx, thisy, thisz, lastx, lasty, lastz,noise(xnoise,ynoise,znoise));
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
    ynoise+=0.0001;
    znoise += 0.0001;
  }
  if(inc < 180) {
    inc+=1;
  }
}

void drawPoint(float x1, float y1, float z1, float x2, float y2, float z2,float noiseFactor) {
  pushMatrix();
  translate(x1*noiseFactor*2, y1*noiseFactor*2, z1*noiseFactor*2);
  noStroke();
  float edgeSize = noiseFactor * 8;
  stroke(0);
  strokeWeight(edgeSize);
  point(x2,y2,z2);
  popMatrix();
}


