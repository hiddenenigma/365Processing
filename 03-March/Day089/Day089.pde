/* Source Cited:
 
 Jan Vantomme 
 Distorted Grids
 http://vormplus.be/blog/article/processing-month-day-28-distorted-grids
 
*/

PVector[][] vertices = new PVector[20][20];
float tw = 1;

void setup() {
  size(500, 500);
  frameRate(30);
  for (int j = 0; j < 20; j++) {
    for (int i = 0; i < 20; i++) {
      vertices[i][j] = new PVector( i*30 + random(-10, 10), j*30 + random(-10, 10));
    }
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");
  background(0);
  smooth();
  translate(-15, -10);
  for (int j = 0; j < 19; j ++) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < 20; i++) {
      fill(random(30));
      stroke(50);
      strokeWeight(tw);
      vertex( vertices[i][j].x, vertices[i][j].y );
      vertex( vertices[i][j+1].x, vertices[i][j+1].y );
      vertices[i][j].x += random(-.5, .5);
      vertices[i][j].y += random(-.5, .5);
    }
    endShape();
  }
  
  for (int j = 0; j < 19; j ++) {
    for (int i = 0; i < 20; i++) {
      fill(random(100, 255));
      noStroke();
      ellipse(vertices[i][j].x, vertices[i][j].y, 5, 5);
    }
    endShape();
  }
  
}
