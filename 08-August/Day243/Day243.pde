/* Souce Cited:
 
 Processing Forums
 http://forum.processing.org/one/topic/toxiclib-voronoi-example-sketch.html
 
*/

import toxi.geom.mesh2d.*;
import toxi.geom.*;
import toxi.processing.*;
import toxi.math.noise.*;

ArrayList<Vec2D> points;
Vec2D p;
Voronoi voronoi;
ToxiclibsSupport gfx;

float x = 0;
float y = 0;

void setup() {
  size(500, 500);
  voronoi = new Voronoi();
  gfx = new ToxiclibsSupport(this);
  points = new ArrayList<Vec2D>();
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  drawVoronoi();
  update();
}

void update() {
  x+= random(1);
  y+= random(-1, 1);
}

void drawVoronoi() {
  for (int i = 0; i < height+250; i+= 250) {
    p = new Vec2D(x, height/2+y);
    points.add(p);
    voronoi.addPoint(p);
  }  
  for (Polygon2D poly : voronoi.getRegions ()) {
    stroke(0);
    gfx.polygon2D(poly);
  }
}

void mouseDragged() {
  voronoi.addPoint(new Vec2D(mouseX, mouseY));
}

