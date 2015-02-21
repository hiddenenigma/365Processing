// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {

  PVector[][] field;
  int cols, rows; 
  int resolution; 

  float xoff = 0.0; 
  float yoff = 0.0;

  FlowField(int r) {
    resolution = r;
    cols = 520/resolution;
    rows = 520/resolution;
    field = new PVector[cols][rows];
    update();
  }

  void update() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float x = i*resolution-height/2;
        float y = j*resolution-height/2;
        float r = sqrt((x*x)+ (y*y));
        float theta = map(noise(x, y), 0, 1, 0, TWO_PI);
        PVector v = new PVector(cos(theta*xoff), sin(theta*yoff));
        v.normalize();
        field[i][j] = v; 
      }
    }
    xoff += 0.008;
    yoff += 0.008;
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j], i*resolution, j*resolution, resolution-2);
      }
    }
  }

  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    translate(x, y);
    if (mousePressed) {
      stroke(255);
    } else {
      stroke(0);
    }
    strokeWeight(1);
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0, 0, len+2, 0);
    popMatrix();
  }
}

