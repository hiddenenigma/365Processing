class Grid3 {
  PVector[][] vertices = new PVector[10][10];
  float tw = 1;
  
  Grid3() {
    for (int j = 0; j < 10; j++) {
      for (int i = 0; i < 10; i++) {
        vertices[i][j] = new PVector( i*20, j*20);
      }
    }
  }
  
  void display() {
    translate(90,90);
    fill(0);
    for (int j = 0; j < 9; j ++) {
      beginShape(TRIANGLE_STRIP);
      for (int i = 0; i < 10; i++) {
        stroke(255);
        strokeWeight(tw);
        vertex( vertices[i][j].x, vertices[i][j].y );
        vertex( vertices[i][j+1].x, vertices[i][j+1].y );
        vertices[i][j].x += random(-.4,.4);
        vertices[i][j].y += random(-.4,.4);
        vertices[i][j+1].x += random(-.4,.4);
        vertices[i][j+1].y += random(-.4,.4);
        }
      endShape();
    }
  }
}
