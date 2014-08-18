float speed = 2;
int num = 500;
float[] x = new float[num];
float[] y = new float[num];

void setup() {
  size(500, 500);
  randomSeed(0);
  background(255);
  noStroke();
  frameRate(30);
  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  fill(random(255), 80);
  for (int i = 0; i < num; i ++) {
    x[i] += random(-2, 2) * speed;
    y[i] +=random(-2, 2) * speed;
    if (mousePressed == true) {
      fill(255, 50);
      ellipse(x[i],y[i], 10, 10);
    } else {
      ellipse(x[i],y[i], 5, 5);
    }
  }
}
