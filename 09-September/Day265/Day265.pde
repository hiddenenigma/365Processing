import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.processing.*;

ArrayList <Polygon2D> polygons = new ArrayList <Polygon2D> ();
ArrayList <Vec2D> points = new ArrayList <Vec2D> ();
Vec2D point;
Voronoi voronoi = new Voronoi();
int numPoints = 1000;
float a = 0;

void setup() {
  size(500, 500, P2D);
  noStroke();
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
//  saveFrame("output/frame####.png");
  background(180, 0, 100, 100);
  if (numPoints > points.size()) {
    point = new Vec2D(random(width), random(height));
    points.add(point);
    voronoi.addPoints(points);
    if (points.size() == numPoints) {
      point.addSelf(new Vec2D(0, -1));
    }
  }

  for (Polygon2D p : voronoi.getRegions ()) {
    int numVertices = p.vertices.size();
    beginShape();
    for (int i=0; i<numVertices; i++) {
      Vec2D v = p.vertices.get(i);
      if (points.size() == numPoints) {
        v.addSelf(new Vec2D(random(-a,a), random(-a,a)));
        a += 0.000001;
      }
      float c = map(i, 0, numVertices, 0, 360);
      fill(c);
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
  }
}

