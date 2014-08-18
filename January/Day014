void setup() {
  size(500, 500);
  smooth();
  frameRate(24);
  noStroke();
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(0);
  for (int x = 15; x < 420; x += 8) {
    for(int y = 15; y < 420; y += 8) {
    float r = random(255);
    fill(r);
    float mx = mouseX / 10;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    if (r < 50) {
      fill(255);
      ellipse((x+39) + offsetA, (y+41) + offsetB, 5, 5);
    }
    ellipse((x + offsetA) + 37, (y + offsetB) + 39, 2, 2);
    }
  }
}
