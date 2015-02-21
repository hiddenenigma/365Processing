import toxi.geom.mesh2d.*;
import toxi.geom.*;
import toxi.processing.*;
import toxi.math.noise.*;

ArrayList<Vec2D> points;
Vec2D p0, p1;
Voronoi voronoi;
ToxiclibsSupport gfx;

float x = 0;
float y = 0;
Vec2D loc;
int numSites = 20;
float radius = 1;
float DSIZE = 10000;
float angle1 = 0;
float radius1 = 1;

void setup() {
  size(500,500);
  voronoi = new Voronoi(DSIZE);
  gfx = new ToxiclibsSupport(this);
  points = new ArrayList<Vec2D>(); 
}

void draw() {
//  saveFrame("output/frame####png");
  background(255);
  translate(width/2, height/2);
  drawVoronoi();
  update();
}

void update() {
  x+= random(-2,2);
  y+= random(-2,2);
  radius += 0.5;
  angle1 += 0.4;
  radius1 += 0.45;
}

void drawVoronoi() {
  for (int i = 0; i < numSites; i++) {
    float angle = i * TWO_PI/numSites;
    p0 = new Vec2D(cos(angle)*radius, sin(angle)*radius);
    p1 = new Vec2D(cos(angle1)*radius1, sin(angle1)*radius1);
    points.add(p0);
    points.add(p1);
    voronoi.addPoint(p0);
    voronoi.addPoint(p1);   
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

