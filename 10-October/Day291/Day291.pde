float r;
float numPoints = 1;
float theta = radians(45);
float s = 2.3;

void setup() {
  size(500, 500);
  smooth(8);
  r = 100;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  scale(s);
  for (int i = 0; i < numPoints; i ++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * (r);
    float y = sin(angle) * (r);
    drawCircle(x, y, r, i);
  }
  popMatrix();
  numPoints+= 1;
  r+=0.01;
  theta+= 0.001;
  s += 0.002;
}

void drawCircle(float x, float y, float radius, float theta2) {
  noFill();  
  stroke(0, 10);
  pushMatrix();
  for (int i = 0; i < 10; i+= 1) {
    ellipse(x/i, y/i, radius, radius);
  }
  popMatrix();
}

