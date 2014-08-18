int numPoints = 30;
PVector[] points = new PVector[numPoints];
float radius = 2;
float theta = 0.002;

void setup() {
  size( 500, 500 );
  frameRate(30);
}

void draw() {
  //    saveFrame("output/frames#################.tif");
  smooth();
  background(0);
  fill(0);
  stroke(255, 50);
  pushMatrix();
  translate( width/2, height/2);

  float angle = TWO_PI / numPoints;
  for (int i = 0; i < numPoints; i++) {
    float x = cos( angle * i ) * radius;
    float y = sin( angle * i ) * radius;
    points[i] = new PVector( x, y );
  }
  radius+=0.2;

  for (int i = 0; i < numPoints; i++) {
    for (int j = 0; j < numPoints; j++) {
      if ( j != i ) {
        line( points[i].x, mouseY/4, mouseX/4, points[j].y );     
        rotate(theta);
        theta++;
      }
    }
  }

  popMatrix();
}
