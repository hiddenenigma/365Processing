/* Source Cited:

Noise Wave by Daniel Shiffman
https://processing.org/examples/noisewave.html

Manipulating Circles by Jan Vantomme
http://vormplus.be/blog/article/processing-month-day-14-manipulating-circles

*/

int numPoints = 360;
PVector[] points = new PVector[numPoints];
float radius = 50;
float yoff = 0.0; 

void setup() {
  size(500, 500, P3D);
  smooth();
  background(255);

  float angle = TWO_PI / numPoints;

  for (int i = 0; i < numPoints; i++) {
    float x = cos( angle * i ) * radius;
    float y = sin( angle * i ) * radius;
    float z = cos( angle * i ) * radius;
    points[i] = new PVector(x, y, z);
  }
}

void draw() {
  //    saveFrame("output/frames#################.tif");
  float xoff = 0; 
  float zoff = 0;       
  stroke(0, 50);
  strokeWeight(1);
  noFill();
  translate(width/2, 200);
  beginShape();
  for (int i = 0; i < numPoints; i++) {
    float y = map(noise(xoff, yoff), 0, 1, 50, 100); 
    float z = map(noise(yoff, zoff), 0, 1, 50, 500); 
    vertex(points[i].x, points[i].y+y, z);
    xoff += 0.04;
    zoff += 0.001;
  }
  endShape(CLOSE);
  yoff += 0.01;
}
