/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 2: L-Systems
 http://www.plethora-project.com/
 
 Video tutorial: http://vimeo.com/32701378
 
*/

import toxi.geom.*;
import peasy.*;

PeasyCam cam;

float a1 = radians(0);
float a2 = radians(0);
float a3 = radians(0);
float a4 = radians(-10);

float theta = 0;

ArrayList <Stick> allSticks;

int emit = 10;
int gen = 8;

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
  l = new Vec3D(0, 0, 0);
  initVel = new Vec3D(1, 0, 0);        
  allSticks.add(new Stick(l, initVel, gen, "B"));

  for (Stick s : allSticks) {
    s.display();
  }
  a1 += 0.01;
  a2 += 0.01;
  a3 += 0.01;
  theta += 0.01;
}

