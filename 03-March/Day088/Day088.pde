/* Source Cited:
 
 Jan Vantomme 
 Distorted Grids
 http://vormplus.be/blog/article/processing-month-day-28-distorted-grids
 
 */

PVector[][] vertices = new PVector[60][60];
boolean scale_up = false;
float tw = 0.5;

void setup() {
  size(500, 500);

  for (int j = 0; j < 50; j++) {
    for (int i = 0; i < 50; i++) {
      vertices[i][j] = new PVector( i*15, j*15);
    }
  }
}

void draw() {
  //  saveFrame("output/frames#################.png");
  background(0);
  stroke(0);
  if (scale_up) { 
    tw = tw + 0.1;
  } else {
    tw = tw -0.1;
  }
  if (tw < 0.5) {
    scale_up = true;
  }
  if (tw > 15) {
    scale_up = false;
  }
  strokeWeight(tw);
  noFill();
  smooth();
  translate(-5, -5);
  for (int j = 0; j < 49; j ++) {
    beginShape(QUAD_STRIP);
    for (int i = 0; i < 50; i++) {
      fill(random(200, 255));
      vertex( vertices[i][j].x, vertices[i][j].y );
      vertex( vertices[i][j+1].x, vertices[i][j+1].y );
      vertices[i][j].x += random(-0.2, 0.2);
      vertices[i][j].y += random(-0.2, 0.2);
    }
    endShape();
  }
}
