// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {

  PVector[][] field;
  int cols, rows;
  int resolution; 

  float zoff = 0.0; 
  
  FlowField(int r) {
    resolution = r;
    cols = 520/resolution;
    rows = 520/resolution;
    field = new PVector[cols][rows];
    update();
  }


  void update() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float x = i*resolution;
        float y = j*resolution;
        float r = sqrt((x*x) + (y*y));
        PVector v = new PVector(cos((r*r)), sin(r*r));
        field[i][j] = v; 
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    zoff += 0.1;
  }


  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }
}




