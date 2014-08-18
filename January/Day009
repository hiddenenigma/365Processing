float angle = 0.0;
float speed = 0.025;
float radius = 212.0;
float sx = 2.0;
float sy = 0.5;
float t = 20;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(30);
  background(0);
}

void draw() {
//  saveFrame("output2/frames#################.tif");

  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);

  for (int x = 40; x < 460; x += 9) {
    float y = height/2 + (sinval * radius);
    fill(random(255));
    ellipse(x, y, t, t);
  }
  for (int y = 40; y < 460; y += 8) {
    float x = width/2 + (sinval * radius);
    fill(random(255));
    ellipse(x, y, t, t); 
  }
  for (int x2 = 40; x2 < 460; x2 += 8) {
    float y2 = height/2 + (sinval * -radius);
    fill(random(255));
    ellipse(x2, y2, t, t); 
  }
  for (int y2 = 40; y2 < 460; y2 += 8) {
    float x2 = width/2 + (sinval * -radius);
    fill(random(255));
    ellipse(x2, y2, t, t); 
  }
}
