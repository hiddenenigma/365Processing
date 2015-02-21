import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.processing.*;
import peasy.*;

ArrayList <Polygon2D> polygons;
ArrayList <Vec2D> points;
float x = 0;

void setup() {
  size(500, 500, P2D);
  noStroke();
  smooth(8);
  polygons = new ArrayList <Polygon2D>();
  points = new ArrayList<Vec2D>();
  for (int i = 0; i < 800; i++) {
    points.add(new Vec2D(random(-1000,width+1000), random(-1000, height+1000)));
  }    
}


void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  translate(-150,0);
  int numPoints = points.size();
  beginShape();
  for (int i=0; i<numPoints; i+=2) {
    float m = millis();
    float y = (int)((((height+sin(m/height)*100))/2));     
    Vec2D v = points.get(i);
    v.interpolateToSelf(new Vec2D(i, height/2), x);
    fill(255);
    vertex(v.x, v.y);
  }
   x+= 0.0001;

  endShape(CLOSE);  
  popMatrix();
}


