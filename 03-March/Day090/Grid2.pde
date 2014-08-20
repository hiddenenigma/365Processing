class Grid2 {
  PVector[][] vertices = new PVector[13][13];
  float tw = 1;
  
  Grid2() {
    for (int j = 0; j < 13; j++) {
      for (int i = 0; i < 13; i++) {
        vertices[i][j] = new PVector( i*30 , j*30);
      }
    }
  }
  
  void display() {
    translate(95,95);
    fill(255);
    for (int j = 0; j < 12; j ++) {
      beginShape(TRIANGLE_STRIP);
      for (int i = 0; i < 13; i++) {
        stroke(0);
        strokeWeight(tw);
        vertex( vertices[i][j].x, vertices[i][j].y );
        vertex( vertices[i][j+1].x, vertices[i][j+1].y );
        vertices[i][j].x += random(-.5,.5);
        vertices[i][j].y += random(-.5,.5);
        vertices[i][j+1].x += random(-.5,.5);
        vertices[i][j+1].y += random(-.5,.5);
        }
      endShape();
    }
  }
}
