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

float a1 = 11;
float a2 = -90;
float a3 = 20;

ArrayList <Stick> allSticks;
int emit = 500;

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
  for (int i = 0; i <= emit; i++) {
    float angle = i * TWO_PI / emit;
    float x = cos(angle)*100;
    float y = sin(angle)*100;
    Vec3D v = new Vec3D(x,y,0);
    Vec3D initVel = new Vec3D(x, y, 0);
    stick = new Stick(v, initVel, 5, "B");
  }  

  allSticks.add(stick);
  stroke(255);
  noFill();
  strokeWeight(1);

  for (Stick s : allSticks) {
    s.display();
  }
  a1++;
  a2++;
  a3++;
}

