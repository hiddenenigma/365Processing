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
float radius = 400;
float DSIZE = 10000;

void setup() {
  size(500,500);
  voronoi = new Voronoi(DSIZE);
  gfx = new ToxiclibsSupport(this);
  points = new ArrayList<Vec2D>(); 
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  translate(width/2, height/2);
  drawVoronoi();
  update();
}

void update() {
  x+= random(-2,2);
  y+= random(-2,2);
//  radius += 0.2;
  radius-= 0.8;
  angle+= 0.4;
}

void drawVoronoi() {
  for (int i = 0; i < numSites; i++) {
    p = new Vec2D(cos(angle)*radius, sin(angle)*radius);
    points.add(p);
    voronoi.addPoint(p);   
  }
  beginShape(TRIANGLES);
  for (Triangle2D t : voronoi.getTriangles()) {
    if((abs(t.a.x)!=DSIZE && abs(t.a.y)!=DSIZE)) {
    stroke(0);
    fill(255);
    gfx.triangle(t);
    }
  }  
  endShape();
}

