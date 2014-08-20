/* Source Cited:

Toxiclibs Library Example
Line2D Intersect

Adam Tindale
Creating Masks in Processing.org
http://www.adamtindale.com/blog/processing/129/

*/

import toxi.geom.*; 
import toxi.processing.*;

ToxiclibsSupport gfx;
ArrayList <Line> lines;
PGraphics msk;

void setup() {
  size(500, 500);
  smooth();
  background(255);
  frameRate(30);
  gfx = new ToxiclibsSupport(this);
  lines = new ArrayList<Line>();
  for (int i = 0; i < 125; i ++) {
    lines.add(new Line(random(width), random(width), random(height), random(height), random(-1, 1), random(0.1, 1)));
  }
  msk = createGraphics(width, height);
  msk.beginDraw();
  msk.background(255);
  msk.noFill();
  msk.strokeWeight(15);
  msk.rectMode(CENTER);
  for (int i = 0; i < height; i += 51) {
    msk.rect(width/2, height/2, i, i);
  }
  msk.endDraw();
}

void draw() {
  //  saveFrame("output3/frames#################.png");
  for (Line l : lines) {
    l.display();
    l.checkEdges();
  }
  blend(msk, 0, 0, width, height, 0, 0, width, height, ADD);
}
