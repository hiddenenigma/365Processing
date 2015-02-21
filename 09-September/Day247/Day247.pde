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
Vec2D loc;
int numSites = 1;
float angle = 0;
float radius = 0;

void setup() {
  size(500,500);
  voronoi = new Voronoi();
  gfx = new ToxiclibsSupport(this);
  points = new ArrayList<Vec2D>(); 
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(255);
  translate(width/2, height/2);
  drawVoronoi();
  update();
}

void update() {
  x+= random(-2,2);
  y+= random(-2,2);
  radius += 0.5;
  angle+= 0.5;
}

void drawVoronoi() {
  for (int i = 0; i < numSites; i++) {
      p = new Vec2D(cos(angle)*radius, sin(angle)*radius);
      points.add(p);
      voronoi.addPoint(p);   
  }    
  
  for (Polygon2D poly : voronoi.getRegions()) {
    stroke(0);
    gfx.polygon2D(poly);
  }
}

