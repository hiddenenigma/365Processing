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

float theta;
ArrayList<Fractal> fractals1, fractals2;
float radius = 400;
PeasyCam cam;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0);
  cam = new PeasyCam(this, 1500);
  
  fractals1 = new ArrayList<Fractal>();
  for (int i = 0; i < radius; i +=2) { 
    float angle = TWO_PI/radius * i;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    Vec3D pt1 = new Vec3D(x, y, -500);
    Vec3D pt2 = new Vec3D(0, 0, 0);  
    fractals1.add(new Fractal(pt1, pt2, 1));
  }
  
  fractals2 = new ArrayList<Fractal>();
  for (int i = 0; i < radius; i +=2) { 
    float angle = TWO_PI/radius * i;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    Vec3D pt1 = new Vec3D(x, y, 500);
    Vec3D pt2 = new Vec3D(0, 0, 0);  
    fractals2.add(new Fractal(pt1, pt2, 1));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  rotateX(radians(90));

  for (Fractal f : fractals1) {
    f.run();
  }
  for (Fractal f : fractals2) {
    f.run();
  }  
}


