/* Source Cited:

Toxiclibs Library Example
Line2D Intersect

*/

import toxi.geom.*; 
import toxi.processing.*;
ToxiclibsSupport gfx;
ArrayList <Line> lines;


void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  gfx = new ToxiclibsSupport(this);
  lines = new ArrayList<Line>();
  for (int i = 0; i < 500; i ++) {
  lines.add(new Line(random(width), random(width), random(height), random(height), random(-1,1), random(20)));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);
  for (Line l: lines){
  l.display();
  }
}



  
