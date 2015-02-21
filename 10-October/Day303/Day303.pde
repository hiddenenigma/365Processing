import processing.opengl.*;

float r;
float numPoints = 1;
float theta=radians(45);
float s = 2;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  r = 1;
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  pushMatrix();
  translate(width/2, 0);  
  rotate(theta);
  scale(s);
  for (int i = 0; i < width; i+=1) {
    drawCircle(i, 0, r);
  }
  popMatrix();
  r+=0.2;
}

void drawCircle(float x, float y, float radius) {
  noFill();
  noStroke(); 
  pushMatrix();
  scale(s);
  rotate(theta);
  for (int i = 0; i < radius; i+=3) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius;
    float y2 = sin(angle) * radius;      
    ellipse(x, y, x2, y2);
    if (i%2==0) {
      fill(0);
    } else {
      fill(255);
    }
  }
  popMatrix();

  if (radius > 1) {
    drawCircle(x, y+radius, radius/2);
    drawCircle(x, y-radius, radius/2);
  }
}

