// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {
  PVector[][] field;
  int cols, rows;
  int res;
  float x, y;
  float zoff;
  
  FlowField(int r) {
    res = r;
    cols = 510/res;
    rows = 510/res;
    field = new PVector[cols][rows];
    x = 10;
    y = 10;
    zoff = 0;
  }
  
  void init() {
    float xoff = 1 / (sqrt((x*x) + ((y-1)*(y-1))));
    for (int i = 0; i < cols; i ++ ) {
      float yoff = 1 / (sqrt((x*x) + ((y+1)*(y+1))));
      for (int j = 0; j < rows; j ++ ) {
        float r = sqrt((xoff*xoff) + (yoff*yoff) + zoff);
        float theta = xoff - yoff - zoff;
        PVector v = new PVector(cos(theta), sin(r));
        field[i][j] = v;
        yoff += 0.2;
      }
      xoff += 0.2;
    }
    zoff += 0.1;
  } 

  
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/res,0,cols-1));
    int row = int(constrain(lookup.y/res,0,rows-1));
    return field[column][row].get();
  }
}
