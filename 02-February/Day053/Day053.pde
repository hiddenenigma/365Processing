float r, r2;
float theta = 0.02;

void setup() {
  size(500, 500);
  frameRate(30);
  noStroke();
  background(0);
}

void draw() {
//  saveFrame("output/frames#################.tif");

  for (int x = 0; x < width; x += 10) {
    for (int y = 0; y < width; y += 10) {
      r = noise(frameCount * 0.02) * random(100,300);
      r2 = noise(frameCount * 0.02) * 255;
      pushMatrix();
      translate(width/2, height/2);
      rotate(theta);
      strokeWeight(.5);
      stroke(255,50);
      fill(255,10);
      point(r, r2);
      theta+= 0.02;
      popMatrix();
    }
  }
}


