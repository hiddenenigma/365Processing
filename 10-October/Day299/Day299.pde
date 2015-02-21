float r;
float numPoints = 1;
float theta=radians(45);
float s = 1;

void setup() {
  size(500, 500);
  smooth(8);
  r = 1;
  background(255);
}

void draw() {
//  saveFrame("output/frame####.png");
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  scale(s);
  for (int i = 0; i < numPoints; i+=50 ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * numPoints;
    float y = sin(angle) * numPoints;
    drawCircle(x, y, r);
  }
  popMatrix();
  numPoints+= 0.1;
  r+=0.02;
  theta+=0.01;
  s -= 0.0001;
}

void drawCircle(float x, float y, float radius) {
  noFill(); 
  noStroke(); 
  pushMatrix();
  translate(x, y);
  rotate(theta);
  for (int i = 0; i < radius; i+= 1) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius;
    float y2 = sin(angle) * radius;      
    ellipse(x, y, x2, y2);
    if (i%2==1) {
      theta+= 0.0001;
      strokeWeight(10);
      stroke(0);
    } else {
      theta-= 0.0001;
      strokeWeight(10);
      stroke(255);
    }
  }
  popMatrix();
}

