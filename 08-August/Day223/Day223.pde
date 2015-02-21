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

float a1 = radians(10);
float a2 = radians(30);
float a3 = radians(50);
float a4 = radians(70);
float theta = 0;

ArrayList <Stick> allSticks;
int emit = 5;
int gen = 10;
int shrinkOrGrow = 1;
Vec3D l;
Vec3D initVel;

float strokeW;

void setup() {
  size(500, 500, P3D);
  smooth(8);
  cam = new PeasyCam(this, 100);
  allSticks = new ArrayList<Stick>();
  strokeW = 3;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  rotateX(theta);
  rotateY(theta);
  rotateZ(theta);

  allSticks.clear(); 
  l = new Vec3D(0, 0, 0);
  initVel = new Vec3D(1, 0, 0);
  for (int i = 1; i <= emit; i++) {
    stick = new Stick(l, initVel, gen, "B", a1, a2, a3, strokeW);    
  }
    allSticks.add(stick);

  for (Stick s : allSticks) {
    s.display();
  }
  popMatrix();

  theta += 0.01;
  changeSize();
}

void changeSize() {
  if (a4 > 70) {
    shrinkOrGrow = 0;
  } else if (a4 < 2) {
    shrinkOrGrow = 1;
  }

  if (shrinkOrGrow == 1) {
    a1 += 0.1;
    a2 += 0.1;
    a3 += 0.1;
    a4 += 0.1;
  } else if (shrinkOrGrow == 0) {
    a1 -= 0.1;
    a2 -= 0.1;
    a3 -= 0.1;
    a4 -= 0.1;
  }
} 



