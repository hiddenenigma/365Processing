float r;
float numPoints = 1;
float theta;
float s = 1.5;

void setup() {
  size(500, 500);
  smooth(8);
  r = 500;
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
    float x = cos(angle) * (numPoints);
    float y = sin(angle) * (numPoints);
    drawCircle(x, y, r, i);
  }
  popMatrix();
  numPoints+= 0.1;
  r-=0.5;
}

void drawCircle(float x, float y, float radius, float theta2) {
  noFill();  
  pushMatrix();
  rotate(theta2);
  for (int i = 2; i < 50; i+= 1) {
    float angle = TWO_PI/50 * i;
    float x2 = cos(angle) * (225);
    float y2 = sin(angle) * (225);      
    ellipse(x+x2, y+y2, radius, radius);
    if (i%2==0) {
      strokeWeight(1);
      stroke(0, 35);
      theta2 += 0.001;
    } else {
      strokeWeight(1);
      stroke(0, 35);
      theta2 -= 0.001;
    }
  }
  popMatrix();
}

