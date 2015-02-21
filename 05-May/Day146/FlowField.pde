// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {

  PVector[][] field;
  int cols, rows; 
  int resolution; 

  float xoff = 0.0; 

  FlowField(int r) {
    resolution = r;
    cols = 540/resolution;
    rows = 540/resolution;
    field = new PVector[cols][rows];
    update();
  }


  void update() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        float x = i*resolution-width/2;
        float y = j*resolution-height/2;
        float r = sqrt((x*x)+ (y*y));
        PVector v = new PVector(sin(r*xoff), 1);
        v.normalize();
        field[i][j] = v; 
      }
    }
    xoff += 0.0005;
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
    stroke(255);
    strokeWeight(1);
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0, 0, len, 0);
    stroke(0);
    line(0, 0, len+5, 0);
    popMatrix();
  }
}



