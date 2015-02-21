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

float a1 = 10;
float a2 = 30;
float a3 = 20;

float theta = 0;
float theta2 = 0;

ArrayList <Stick> allSticks;
int emit = 65;

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
  rotateY(theta+150);
  rotateZ(theta2);

  for (int i = 0; i <= emit; i++) {
    for(int j = 0; j < emit; j ++) {

      float angle = i * TWO_PI / emit;
      float x = cos(angle)*15;
      float y = sin(angle)*15;
      Vec3D v = new Vec3D(0,0,0);
      Vec3D initVel = new Vec3D(x, y, 0);
      stick = new Stick(v, initVel, 8, "B");
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
  
  // angles of stick
  a1++;
  a2++;
  a3++;
}


