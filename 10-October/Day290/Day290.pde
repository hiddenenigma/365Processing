float r;
float numPoints = 0;
float theta = radians(45);
float s = 2.5;

void setup() {
  size(500, 500);
  smooth(8);
  r = 0;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  for (int i = 0; i < numPoints; i ++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * 100;
    float y = sin(angle) * 100;

    drawCircle(x, y, r);
  }
  popMatrix();
  numPoints+= 0.75;
  r+=0.5;
  theta+= 0.005;
}

void drawCircle(float x, float y, float radius) {
  noFill();
  stroke(0, 50);
  strokeWeight(1);
  ellipse(x/4, y, radius, radius);
  ellipse(x, y/4, radius, radius);
  rotate(radians(45));
}

