/* Source Cited:
 
 Generative Art: A Practical Guide Using Processing by Matt Pearson
 Page 99 - 5.3.3 The wrong way to draw a sphere
 
*/

import processing.opengl.*;
import peasy.*;

PeasyCam cam;
float radius = 100;
float xnoise, ynoise, znoise, xstart, ystart, zstart;
int sd = 5;
float inc=1;
void setup() { 
  size(500, 500, OPENGL);
  smooth(8);
  background(255);
  stroke(0);
  cam = new PeasyCam(this, 225);
  xstart = random(10);
  ystart = random(10);
  zstart = random(10);
}
void draw () {
//  saveFrame("output/frames####.tif");

  background(255);
  rotateX(frameCount*0.01);
  rotateY(frameCount*0.01);
  sphereDetail(sd);
  xstart += 0.01;
  ystart += 0.01; 
  zstart += 0.01;
  xnoise = xstart;
  ynoise = ystart; 
  znoise = zstart;

  float t = 0;
  float s = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < inc) {
    s += 1;
    t += 0.1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius * cos(radianS) * sin(radianT));
    float thisy = 0 + (radius * sin(radianS+ynoise) * sin(radianT));
    float thisz = 0 + (radius * cos(radianT+znoise)); 
    if (lastx != 0) {
      xnoise+=0.005;
      drawPoint(thisx, thisy, thisz, noise(xnoise, ynoise, znoise));

    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
    ynoise+=0.005;
    znoise += 0.005;
  }
  if (inc < 180*5) {
    inc+=1.25;
  }
}

void drawPoint(float x, float y, float z, float noiseFactor) {
  pushMatrix();
  translate(x*noiseFactor, y*noiseFactor, z*noiseFactor);
  float sphereSize = noiseFactor * 5;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  fill(grey, alph);
  stroke(0,85);
  sphere(sphereSize);
  popMatrix();
}

