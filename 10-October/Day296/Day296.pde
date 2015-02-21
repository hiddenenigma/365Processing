float r;
float numPoints = 90;
float theta;
float s = 0.5;

void setup() {
  size(500, 500);
  smooth(8);
  r = 1;
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
    drawCircle(x, y, x*y, i);
  }
  popMatrix();
  numPoints+= 0.01;
  s += 0.0001;
}

void drawCircle(float x, float y, float radius, float theta2) {
  noFill();  
  pushMatrix();
  rotate(radians(theta2));
  for (int i = 0; i < 25; i+= 1) {
    float angle = TWO_PI/25 * i;
    float x2 = cos(angle) * 25;
    float y2 = sin(angle) * 25;      
    ellipse(x+x2, y+y2, radius, radius);
    if (i%2==0) {
      strokeWeight(7);
      stroke(255);
      theta2 += 0.1;
    } else {
      strokeWeight(7);
      stroke(0);
      theta2 -= 0.1;
    }
  }
  popMatrix();
}

