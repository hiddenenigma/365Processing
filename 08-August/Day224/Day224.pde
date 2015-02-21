/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 2: L-Systems
 http://www.plethora-project.com/
 
 Video tutorial: http://vimeo.com/32701378
 
*/

import toxi.geom.*;
import peasy.*;

PeasyCam cam;
Stick stick;

float a1 = radians(0);
float a2 = radians(0);
float a3 = radians(0);
float a4 = radians(-10);
float theta = 0;

ArrayList <Stick> allSticks;
int emit = 80;
int gen = 5;
int shrinkOrGrow = 1;
Vec3D l;
Vec3D initVel;

float strokeW;

void setup() {
  size(500, 500, P3D);
  smooth(8);

  cam = new PeasyCam(this, 150);
  allSticks = new ArrayList<Stick>();
  strokeW = 3;
}

void draw() {
//  saveFrame("output/frame####.png");
  pushMatrix();
  background(0);

  allSticks.clear(); 
  for (int i = -emit; i <= emit; i+= 10) {
    for (int j = -emit; j <= emit; j += 10) {
      for (int k = -emit; k < emit; k += 10) {
        float angle = i * TWO_PI  / emit;        
        float x = cos(angle);
        float y = sin(angle);
        l = new Vec3D(i, j, 0);
        initVel = new Vec3D(x, y, 0);
        stick = new Stick(l, initVel, gen, "B", a1, a2, a3, strokeW);
      }
    }
  }

  allSticks.add(stick);

  for (Stick s : allSticks) {
    s.display();
  }
  popMatrix();


  a1 += 0.01;
  a2 += 0.01;
  a3 += 0.01;
  theta += 0.01;
}

void changeSize() {
  if (a1 > 500) {
    shrinkOrGrow = 0;
  } else if (a1 < 1) {
    shrinkOrGrow = 1;
  }

  if (shrinkOrGrow == 1) {
    a1 += 0.05;
    a2 += 0.05;
    a3 += 0.05;
    a4 += 0.05;
  } else if (shrinkOrGrow == 0) {
    a1 -= 0.01;
    a2 -= 0.01;
    a3 -= 0.01;
    a4 -= 0.01;
  }
} 

