float r;
float numPoints = 100;
float theta=radians(45);
float s = 0.1;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  smooth(8);
  r = 1;
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  translate(25, 25);

  for (int i = 0; i < width+150; i+=150 ) {
      for (int j = 0; j < height+150; j+=150 ) {
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
  for (int i = 0; i < radius; i+= 1) {
    float angle = TWO_PI/radius * i;
    float x2 = cos(angle) * radius;
    float y2 = sin(angle) * radius;      
    rect(x2, y2, radius, radius);
    if (i%2==0) {
      strokeWeight(10);
      stroke(255);
    } else {
      strokeWeight(10);
      stroke(0);
    }
  }
  popMatrix();
}

