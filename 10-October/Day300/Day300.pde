float r;
float numPoints = 1;
float theta=radians(45);
float s = 1;

void setup() {
  size(500, 500);
  smooth(8);
  r = 30;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  scale(s);
  for (int i = -500; i < 550; i+=50 ) {
    for (int j = -500; j < 550; j+=50 ) {
      drawCircle(i/1.2, j/1.2, r);
    }
  }
  popMatrix();
  r+=0.1;
}

void drawCircle(float x, float y, float radius) {
  noFill(); 
  pushMatrix();
  translate(x, y);
  rotate(theta);
  for (int i = 0; i < radius; i+=1) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius;
    float y2 = sin(angle) * radius;      
    ellipse(0, 0, x2, y2);
    if (i%2==0) {
      strokeWeight(5);
      stroke(255);
    } else {
      strokeWeight(5);
      stroke(0);
    }
  }
  popMatrix();
}

