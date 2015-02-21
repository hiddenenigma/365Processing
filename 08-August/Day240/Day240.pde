/* Souce Cited:
 
 Processing Forums
 http://forum.processing.org/one/topic/toxiclib-voronoi-example-sketch.html
 
*/

import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;

ToxiclibsSupport gfx;

Voronoi v;

ArrayList<Vec2D> points;
int res = 250;

void setup() {
  size(500, 500);
  v = new Voronoi();
  gfx = new ToxiclibsSupport(this);
  points = new ArrayList<Vec2D>();
  for (int i=0; i < width+res; i+= res) {
    for (int j = 0; j < height+res; j+= res) {
      points.add(new Vec2D(i, j));
    }
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  stroke(0);
  v.addPoints(points);
  for (Polygon2D poly : v.getRegions ()) {
    gfx.polygon2D(poly);
  }
}

void mouseDragged() {
  v.addPoint(new Vec2D(mouseX, mouseY));
}

