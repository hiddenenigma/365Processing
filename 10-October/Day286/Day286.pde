float r;
float theta;
int numPoints = 200;

void setup() {
  size(500, 500);
  smooth(8);
  r = 100;
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
    exit();
  }
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < numPoints; i ++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * r;
    float y = sin(angle) * r;
    drawCircle(x, y, r);
  }
  popMatrix();
}

void drawCircle(float x, float y, float radius) {
  noFill();  
  stroke(0,95);
  strokeWeight(1);
  pushMatrix();
  rotate(theta);
  ellipse(x, y, radius, radius);
  if (radius > 50) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
  }
  theta+=0.01;
  popMatrix();
}

