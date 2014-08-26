// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution;
  
  FlowField() {
    resolution = 10;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        field[i][j] = new PVector(1,0);
      }
    }
  }
}
  
 
