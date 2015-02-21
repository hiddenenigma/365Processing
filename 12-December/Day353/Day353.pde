/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 1 - Tutorial 20: Fractals
 http://www.plethora-project.com/
 
 Video tutorial: https://vimeo.com/21035308
 
*/

import processing.opengl.*;
import toxi.geom.*;

ArrayList<Fractal> fractals;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(255);
  fractals = new ArrayList<Fractal>();
  for (int i = 0; i < 50; i ++) {
    Vec3D pt1 = new Vec3D(random(-100,width+100), random(-100,height+100), 0);
    Vec3D pt2 = new Vec3D(width/2, height/2, 0);  
    fractals.add(new Fractal(pt1, pt2, random(3)));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");

  background(0);
  for (Fractal f : fractals) {
    f.run();
  }
}

