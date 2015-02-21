float r;
float numPoints = 1;
float theta = radians(45);
float s = 2.3;

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
  scale(1);
  for (int i = 0; i < numPoints; i ++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * (numPoints/5.5);
    float y = sin(angle) * (numPoints/5.5);

    drawCircle(x, y, numPoints/1.5);
  }
  popMatrix();
  numPoints+= 0.08;
  theta+= 0.01;
}

void drawCircle(float x, float y, float radius) {
  noFill();  
  stroke(0, 50);
  pushMatrix();
  for (int i = 0; i < 15; i+= 1) {
    ellipse(x*i, y*i, radius, radius);
  }
  popMatrix();

  if (radius > 1) {
    drawCircle(x*1.1, y*1.1, radius/2);
  } 
}

