/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 1 - Tutorial 19: Recursion
 http://www.plethora-project.com/
 
 Video tutorial: https://vimeo.com/20463950
 
*/

import toxi.geom.*;

float s = 0;
float s2 = 1;

void setup() {
  size(500, 500);
  noFill();
}

void draw() {
//  saveFrame("output/frame####.png");
  
  background(0);
  Vec3D a = new Vec3D(0, height/2, 0);
  Vec3D b = new Vec3D(width, height/2, 0);
  pushMatrix();
  translate(width/2, height/2);
  scale(s2);
  for (int i = 0; i < 360; i += 2) {
    recursiveCircle(a, b, 10, radians(i));
  }
  popMatrix();
  s+=0.002;
  s2-= 0.002;
}

void recursiveCircle(Vec3D v1, Vec3D v2, int iterations, float theta) {
  if (iterations > 2) {
    stroke(255,25);
    strokeWeight(1.5);
    float di = v1.distanceTo(v2);
    Vec3D ap = v1.add(v2);
    ap.scaleSelf(s);
    pushMatrix();
    rotate(theta);
    line(ap.x, ap.y, di, di);
    popMatrix();
    recursiveCircle(v1, ap, iterations-1, theta);
    recursiveCircle(ap, v2, iterations-1, theta);
  }
}

