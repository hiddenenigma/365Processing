float r;
int numPoints = 0;
float theta;
float s = 2.5;

void setup() {
  size(500, 500);
  smooth(8);
  r = 200;
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
    exit();
  }
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  rotate(theta);
  for (int i = 0; i < numPoints; i ++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * r;
    float y = sin(angle) * r;
    drawCircle(x, y, r);
  }
  popMatrix();
  numPoints++;
  theta+= 0.01;
  s-= 0.003;
  println(frameCount);
}

void drawCircle(float x, float y, float radius) {
  noFill();  
  stroke(0,85);
  strokeWeight(1);
  pushMatrix();
  ellipse(x, y, radius, radius);
  if (radius > 100) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
  } 
  popMatrix();
}

