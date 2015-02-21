import processing.opengl.*;

float r;
float numPoints = 1;
float theta = radians(45);
float s = 1.5;

void setup() {
  size(500, 500, OPENGL);
  rectMode(CENTER);
  smooth(8);
  r = 0;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  translate(width/2, height/2);  
  rotate(theta);
  scale(s);
  drawCircle(0, 0, r);
  popMatrix();
  r+=0.1;
  s+=0.001;
}

void drawCircle(float x, float y, float radius) {
  noFill();
  noStroke(); 
  pushMatrix();
  rotate(theta);
  for (int i = 0; i < radius; i+=1) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius;
    float y2 = sin(angle) * radius;      
    ellipse(x, y, x2*2, y2*2);
    if (i%2==0) {
      fill(0);
    } else {
      fill(255);
    }
  }
  popMatrix();

  if (radius > 1) {
    drawCircle(x+radius, y, radius/2);
    drawCircle(x-radius, y, radius/2);
    drawCircle(x, y+radius, radius/2);
    drawCircle(x, y-radius, radius/2);
  }
}

