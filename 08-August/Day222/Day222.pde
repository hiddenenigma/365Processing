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

float a1 = radians(90);
float a2 = radians(-90);
float a3 = radians(30);
float theta = 0;

ArrayList <Stick> allSticks;
int emit = 250;
int gen = 8;
int shrinkOrGrow = 1;
Vec3D l;
Vec3D initVel;


void setup() {
  size(500, 500, P3D);
  smooth(8);
  cam = new PeasyCam(this, 400);
  allSticks = new ArrayList<Stick>();
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  rotateX(theta);
  rotateY(theta);
  rotateZ(theta);

  allSticks.clear(); 
  for (int i = -emit; i <= emit; i++) {
    float angle = i * TWO_PI / emit;        
    float x = cos(angle);
    float y = sin(angle);
    l = new Vec3D(0, 0, 0);
    initVel = new Vec3D(x, y, 0);
    stick = new Stick(l, initVel, gen, "B", a1, a2, a3);
  }
  allSticks.add(stick);


  for (Stick s : allSticks) {
    s.display();
  }
  popMatrix();

  a1+= 0.02;
  a2+= 0.02;
  a3+= 0.02;

  theta += 0.01;
}

void changeSize() {
  if (a2 > 190) {
    shrinkOrGrow = 0;
  } else if (a2 < 65) {
    shrinkOrGrow = 1;
  }

  if (shrinkOrGrow == 1) {
    a2 ++;
    a3 ++;
  } else if (shrinkOrGrow == 0) {
    a2 --;
    a3 --;
  }
} 

