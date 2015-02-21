/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 1 - Tutorial 20: Fractals
 http://www.plethora-project.com/
 
 Video tutorial: https://vimeo.com/21035308
 
*/

import processing.opengl.*;
import peasy.*;
import toxi.geom.*;
import toxi.physics.*;

ArrayList<Fractal> fractals;
float theta;
float radius = 360;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0);
  fractals = new ArrayList<Fractal>();
  for (int i = 0; i < radius; i +=2) {
    float angle = TWO_PI/radius * i;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    Vec3D pt1 = new Vec3D(x, y, 0);
    Vec3D pt2 = new Vec3D(0, 0, 0);  
    fractals.add(new Fractal(pt1, pt2, 2));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  pushMatrix();
  translate(width/2, height/2);
  for (Fractal f : fractals) {
    f.run();
  }
  popMatrix();
}

