class Grid1 {
  PVector[][] vertices = new PVector[20][20];
  float tw = 1;
  
  Grid1() {
    for (int j = 0; j < 20; j++) {
      for (int i = 0; i < 20; i++) {
        vertices[i][j] = new PVector( i*45 , j*45 );
      }
    }
  }
  
  void display() {
    translate(-23,-23);
    noFill();
    for (int j = 0; j < 19; j ++) {
      beginShape(TRIANGLE_STRIP);
      for (int i = 0; i < 20; i++) {
        stroke(255);
        strokeWeight(tw);
        fill(0);
        vertex( vertices[i][j].x, vertices[i][j].y );
        vertex( vertices[i][j+1].x, vertices[i][j+1].y);
        vertices[i][j].x += random(-1,1);
        vertices[i][j].y += random(-1,1);
        }
      endShape();
    }
  }
}
