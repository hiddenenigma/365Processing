void setup() {
  background(0);
  size(500, 500);
  frameRate(30);
  smooth();
  noFill();
}

void draw() {
//  saveFrame("output2/frames#################.png");
  randomSeed(0);
  strokeWeight(5);
  stroke(0, 60);
    if (mousePressed == true) {
    fill(0, 100);
  } else {
    fill(255, 26);
  }
  for (int i = 0; i <900; i += 15) {
  float begin = radians(i);
  float end = begin + HALF_PI;
  rotate(radians(frameCount * 8 % 200));
  arc(mouseX, mouseY, i, i, begin, end);
  }
}



