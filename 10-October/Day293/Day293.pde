float r;
float numPoints = 1;
float theta;
float s = 1;

void setup() {
  size(500, 500);
  smooth(8);
  r = 300;
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
   exit();
  }
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  scale(s);
  for (int i = 0; i < numPoints; i ++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * (numPoints);
    float y = sin(angle) * (numPoints);
    drawCircle(x, y, r, i);
  }
  popMatrix();
  numPoints+= 0.1;
  r+=0.1;
  theta+= 0.01;
}

void drawCircle(float x, float y, float radius, float theta2) {
  noFill();  
  pushMatrix();
  rotate(theta2);
  for (int i = 1; i < 16; i+= 1) {
      ellipse(x*i, y*i, radius, radius);
      if(i%2==0) {
        strokeWeight(1);
        stroke(0,75);
        theta2 += 0.2;
      } else {
        strokeWeight(1);
        stroke(0,75);
        theta2 -= 0.2;
    }
  }
  popMatrix();
}

