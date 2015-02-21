float r;
float numPoints = 100;
float theta=radians(45);
float s = 0.1;

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
  for (int i = -250; i < 250; i+=55 ) {
      for (int j = -250; j < 250; j+=55 ) {
        drawCircle(i, j, r);
    }
  }
  popMatrix();
  r+=0.1;
}

void drawCircle(float x, float y, float radius) {
  noFill(); 
  noStroke(); 
  pushMatrix();
  translate(x,y);
  rotate(theta);
  for (int i = 0; i < radius; i+= 1) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius;
    float y2 = sin(angle) * radius;      
    line(x, y, x2, y2);
    if (i%2==0) {
      theta+= 0.002;
      strokeWeight(10);
      stroke(0);
    } else {
      theta-= 0.002;
      strokeWeight(10);
      stroke(255);
    }
  }
  popMatrix();
}

