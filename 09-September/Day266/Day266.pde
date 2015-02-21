import toxi.geom.*;
import toxi.geom.mesh2d.*;

ArrayList <Polygon2D> polygons = new ArrayList <Polygon2D>();
ArrayList <Vec2D> points = new ArrayList <Vec2D>();
Vec2D point;
Voronoi voronoi = new Voronoi();
float f = 0;

void setup() {
  size(500, 500, P2D);
  noStroke();
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
//  saveFrame("output/frame####.png");
  points.clear();
  for (int i = 0; i < 450; i++) {
    point = new Vec2D(width/2, height/2);
    point.interpolateToSelf(new Vec2D(random(0, width), random(0, height)), f);
    points.add(point);
  }
  
  f+= 0.01;
  voronoi.addPoints(points);
  
  for (Polygon2D p : voronoi.getRegions ()) {
    int numVertices = p.vertices.size();
    beginShape();
    for (int i=0; i<numVertices; i++) {
      Vec2D v = p.vertices.get(i);
      float c = map(i, 0, numVertices, 0, 360);
      fill(c);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
}

