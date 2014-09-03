// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {
  
  PVector[][] field;
  int cols, rows;
  int resolution;
  float zoff = 0;

  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    field  = new PVector[cols][rows];
    init();
  }
  
  void init() {
    float xoff = 0;
    for (int i = 0; i < cols; i ++) {
      float yoff = 0;
      for (int j = 0; j < rows; j ++) {
        float theta = map(noise(xoff,yoff,zoff),0,1,0,TWO_PI);
        field[i][j] = PVector.fromAngle(theta);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
   zoff += 0.01;
  }
  
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-2));
    int row = int(constrain(lookup.y/resolution,0,rows-2));
    return field[column][row].get();
  }
}
