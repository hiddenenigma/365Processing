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

float a1 = 0;
float a2 = 65;
float a3 = 70;

float theta = 0;
float theta2 = 0;

ArrayList <Stick> allSticks;
int emit = 100;
int gen = 20;
int shrinkOrGrow = 1;


void setup() {
  size(500, 500, P3D);
  smooth(8);

  cam = new PeasyCam(this, 100);
  allSticks = new ArrayList<Stick>();
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  allSticks.clear(); 
  pushMatrix();
  rotateX(theta-100);
  rotateY(theta+250);
  rotateZ(theta2);
  for (int i =-emit; i <= emit; i++) {
    for (int j = -emit; j <= emit; j ++) {
      float angle = i * TWO_PI / emit;        
      float x = cos(angle);
      float y = sin(angle);
      Vec3D v = new Vec3D(0, 0, 0);
      Vec3D initVel = new Vec3D(0, i*y, j*x);
      stick = new Stick(v, initVel, gen, "B");
    }
  }  
  allSticks.add(stick);
  stroke(255);
  noFill();
  strokeWeight(1);
  for (Stick s : allSticks) {
    s.display();
  }
  popMatrix();
  theta+= 0.01;
  theta2+= 0.01;
  changeSize();
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

