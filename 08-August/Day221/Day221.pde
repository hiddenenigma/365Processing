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
float a2 = radians(-20);
float a3 = radians(90);

ArrayList <Stick> allSticks;
int emit = 50;
int gen = 10;
int shrinkOrGrow = 1;
Vec3D l;
Vec3D initVel;

void setup() {
  size(500, 500, P3D);
  smooth(8);
  cam = new PeasyCam(this, 150);
  allSticks = new ArrayList<Stick>();
}

void draw() {
//  saveFrame("output/frame####.png");
  
  background(0);
  allSticks.clear(); 
  for (int i =-emit; i <= emit; i++) {
    for (int j = -emit; j <= emit; j ++) {
      for (int k = 0; k < emit; k += 10) {
        float angle = i * TWO_PI / emit;        
        float x = cos(angle)*100;
        float y = sin(angle) * 100;
        l = new Vec3D(x, y, 0);
        initVel = new Vec3D(i, j, k);
        stick = new Stick(l, initVel, gen, "B", a1, a2, a3);
      }
    }
  }
  allSticks.add(stick);


  for (Stick s : allSticks) {
    s.display();
  }

  a1+= 0.01;
  a2+= 0.01;
  a3+= 0.01;
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

