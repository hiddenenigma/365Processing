// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class FlowField {

  PVector[][] field;
  int cols, rows; 
  int resolution; 


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
        float x = i*resolution-width/2;
        float y = j*resolution-height/2;
        float r = sqrt((x*x)+ (y*y));
        PVector v = new PVector(((3*x*y)/pow(r,3)), ((2*(y*y)-(x*x))/pow(r,3)));
        v.normalize();
        field[i][j] = v; 
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}


