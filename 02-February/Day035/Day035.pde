float theta = 0.01;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  stroke(255);
  
}

void draw() {
//  saveFrame("output/frames#################.tif");

  background(0);

  for (int y = 0; y < height; y += 10) {
      for(int x = 0; x < width; x += 10) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(theta);
      strokeWeight(1);
      point(mouseX, y);
      strokeWeight(3);
      point(x, mouseY);
      theta++;
      popMatrix();
    }
  }
}
