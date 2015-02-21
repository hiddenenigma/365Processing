float r;
float numPoints = 1;
float theta;
float s = 0.25;

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
  numPoints+= 1.5;
  s += 0.0001;
}

void drawCircle(float x, float y, float radius, float theta2) {
  noFill();  
  pushMatrix();
  rotate(theta2);
  for (int i = 1; i < 15; i+= 3) {
    float angle = TWO_PI/15 * i;
    float x2 = cos(angle) * 10;
    float y2 = sin(angle) * 10;      
    line(x+x2, y+y2, radius, radius);
    if (i%2==0) {
      strokeWeight(5);
      stroke(0, 75);
      theta2 += 0.1;
    } else {
      strokeWeight(1);
      stroke(0, 45);
      theta2 -= 0.1;
    }
  }
  popMatrix();
}

