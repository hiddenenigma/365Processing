import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;

ArrayList <Polygon2D> polygons = new ArrayList <Polygon2D>();
ArrayList <Vec2D> points = new ArrayList <Vec2D>();
Vec2D point;

ToxiclibsSupport gfx;

float x, y, angle, radius;

void setup() {
  size(500, 500, P2D);
  noStroke();
  smooth(8);
  colorMode(HSB,360,100,100,100);
  gfx = new ToxiclibsSupport(this);
  angle = 0;
  radius = 0;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(180,0,100,100);
  update();
  point = new Vec2D(x, y);
  points.add(point);
  int numPoints = points.size();
  beginShape();
  for (int i=0; i<numPoints; i++) {
    Vec2D v = points.get(i);
    float c = map(i, 0, numPoints, 0, 360);
    fill(c);
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}

void update() {
  x = cos(angle) * radius + width/2;
  y = sin(angle) * radius + height/2;      
  angle+= 0.1;
  radius+= 0.1;
}
