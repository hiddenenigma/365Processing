import processing.opengl.*;

float r;
float numPoints = 1;
float theta=radians(45);
float s = 2;

void setup() {
  size(500, 500, OPENGL);
  rectMode(CENTER);
  smooth(8);
  r = 1;
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
  r+=0.2;
  s+=0.001;
}

void drawCircle(float x, float y, float radius) {
  noFill();
  noStroke(); 
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(theta);
  for (int i = 0; i < radius; i+=1) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius/2;
    float y2 = sin(angle) * radius/2;      
    rect(x, y, x2/2,y2/2);
    if (i%2==0) {
      theta += 0.000001;
      fill(0);
    } else {
      theta -= 0.000001;
      fill(255);
    }
  }
  popMatrix();

  if (radius > 1) {
    drawCircle(x/2, y, radius/2);
  }
}

