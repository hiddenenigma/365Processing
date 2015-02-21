/* Source Cited:
 
 Generative Art: A Practical Guide Using Processing by Matt Pearson
 Page 99 - 5.3.3 The wrong way to draw a sphere
 
 */

import processing.opengl.*;
import peasy.*;

PeasyCam cam;

float radius = 40;
float xnoise, ynoise, znoise, xstart, ystart, zstart;

void setup() {
  size(500, 500, OPENGL);
  background(255);
  stroke(0);
  cam = new PeasyCam(this, 100);
  xstart = 0.1;
  ystart = random(10);
  zstart = random(10);
}
void draw() {
//  saveFrame("output/frames####.tif");

  background(255); 
  rotateY(radians(90));
  rotateX(radians(90)); 
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  xstart += 0.01;
  ystart += 0.01;
  zstart += 0.01;
  xnoise = xstart;
  ynoise = ystart;
  znoise = zstart;
  while (t < 180) {
    s += xnoise;
    t += 0.2;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius * cos(radianS) * sin(radianT));
    float thisy = 0 + (radius * sin(radianS) * sin(radianT));
    float thisz = 0 + (radius * cos(radianT)); 
    if (lastx != 0) {
      stroke(0);
      strokeWeight(1);
      line(thisx, thisy, thisz, lastx, lasty, lastz);
      xnoise+=0.001;
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
    ynoise+=0.001;
    znoise += 0.0001;
  }
}

void drawPoint(float x, float y, float z, float noiseFactor) {
  noStroke();
  float edgeSize = noiseFactor * 8;
  float alph = 150 + (noiseFactor * 100);
  stroke(0, alph);
  strokeWeight(edgeSize);
  point(x, y, z);
}

