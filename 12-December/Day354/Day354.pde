/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 1 - Tutorial 20: Fractals
 http://www.plethora-project.com/
 
 Video tutorial: https://vimeo.com/21035308
 
*/

import processing.opengl.*;
import toxi.geom.*;
import toxi.physics.*;

ArrayList<Fractal> fractals;
float radius = 175;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0,75);
  fractals = new ArrayList<Fractal>();
  for (int i = 0; i < radius; i ++) {
    float angle = TWO_PI/i * radius;
    float x = cos(angle) * radius + width/2;
    float y = sin(angle) * radius + height/2;
    Vec3D pt1 = new Vec3D(x, y, 0);
    Vec3D pt2 = new Vec3D(width/2, height/2, 0);  
    fractals.add(new Fractal(pt1, pt2, random(1,3), random(-2,2)));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  for (Fractal f : fractals) {
    f.run();
  }
}

