/* Source cited:
Processing: A Programming Handbook for Visual Designers and Artists 
by Casey Reas and Ben Fry
pg. 340-341
*/

int num = 500;
float[] x = new float[num];
float[] y = new float[num];
PImage img1;
PImage img2;
float r = random(10);

void setup() {
  size(500, 500);
  smooth();
  frameRate(35);
  background(0);
  img1 = loadImage("upclose1a.jpg");
  img2 = loadImage("dsc_7870.jpg");
  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {
  for (int i = 0; i < num; i++) {
    color c = img2.get(int(x[i]), int(y[i]));
    float b = brightness(c) / 255.0;
    float speed = pow(b, 2) + 0.02;
    x[i] += speed;
    if (x[i] > width) {
      x[i] = 0;
      y[i] = random(height);
    }
    stroke(random(255), 50);
//    fill(random(255));
    ellipse(x[i], y[i], 5, 5);
  }
    for (int i = 0; i < num; i++) {
    color c = img1.get(int(x[i]), int(y[i]));
    float b = brightness(c) / 255.0;
    float speed = pow(b, 2) + 0.02;
    y[i] += speed;
    if (y[i] > height) {
      x[i] =  random(width);
      y[i] = 0;
    }
    point(x[i], y[i]);
  }
}
