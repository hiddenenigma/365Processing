import toxi.geom.*;
import toxi.geom.mesh2d.*;

import toxi.util.*;
import toxi.util.datatypes.*;

import toxi.processing.*;
import peasy.*;

ArrayList <Polygon2D> polygons;
ArrayList <Vec2D> points;
float d = 0;
float radius = 175;
int count = 0;
boolean interpolate = false;

void setup() {
  size(500, 500, P2D);
  noStroke();
  smooth(8);
  polygons = new ArrayList <Polygon2D>();
  points = new ArrayList<Vec2D>();
  for (int i = 0; i < 360; i++) {
    float angle = TWO_PI/500 * i;
    float x = cos(angle) * 25 + width/2;
    float y = sin(angle) * 25 + height/2;
    points.add(new Vec2D(x+random(-200,200), y+random(-200,200)));
  }
}



void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  int numPoints = points.size();
  
  beginShape(); 
  for (int i=0; i < numPoints; i++) {
    Vec2D v = points.get(i); 
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * radius + width/2;
    float y = sin(angle) * radius + height/2;
    v.interpolateToSelf(new Vec2D(x, y), d);
    if (mousePressed) {
      v.interpolateToSelf(new Vec2D(random(width), random(height)), d);
    }
    fill(0);
    vertex(v.x, v.y);
  }
  d+= 0.0001;
  count++;
  endShape(CLOSE);  
}

