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

float a1 = -90;
float a2 = 50;
float a3 = -20;

ArrayList <Stick> allSticks;


void setup() {
  size(500,500,P3D);
  smooth();

  cam = new PeasyCam(this, 500);
  allSticks = new ArrayList<Stick>();

}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  allSticks.clear(); 
  
  Vec3D v = new Vec3D(0,0,0);
  Vec3D initVel = new Vec3D(1,0,0);
  stick = new Stick(v, initVel, 13, "C");  

  allSticks.add(stick);
  stroke(255);
  noFill();
  strokeWeight(1);
//  box(500);
  for (Stick s : allSticks) {
    s.run();
  }
  a1+= 0.5;
  a2+= 0.5;
  a3+= 0.5;
}
