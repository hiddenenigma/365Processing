float theta = 0.01;

void setup() {
  size(500, 500, P3D);
  smooth();
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(0);
  for (int x = 0; x < 200; x += 5) {
      for(int y = 0; y < 200; y += 5) {
      pushMatrix();
      translate(width/2, height/2);
      rotateZ(theta);
      stroke(255);
      strokeWeight(random(0.001, 0.01));
      ellipse(0, 0, x, 0);
      ellipse(10, 0, x, 0);

      stroke(255, 75);
      ellipse(25,0, x, 0);
      stroke(255, 50);
      ellipse(100,0, x, 0);
      stroke(255, 25);

      theta++;
      popMatrix();
    }
  }
}
