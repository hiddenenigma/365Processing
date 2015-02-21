/* Source Cited:
 
 Fireworks by Reona
 OpenProcessing Tweak of http://www.openprocessing.org/sketch/113809
 
*/

Flower[] flowers = new Flower[15];

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(0);
  smooth();
  for (int i = 0; i < flowers.length; i++) {
    flowers[i] = new Flower(random(3));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");

  noStroke();
  fill(0, 10);
  rect(0, 0, width, height); 
  for (int i = 0; i < flowers.length; i++) {
    flowers[i].display();
  }
}

class Dot {
  float hue;

  float R = random(10, 100);
  float theta = random(TWO_PI);

  float x;
  float y;

  float goal_x = R * cos(theta);
  float goal_y = R * sin(theta);

  float easing_x = random(0.03, 0.07);
  float easing_y = random(0.03, 0.07);

  float sat = 0;
  float brt = random(50, 100); 

  Dot(float tmpHue) {
    x = 0;
    y = 0;
    hue = tmpHue;
  }

  void move() {
    x += (goal_x - x) * easing_x;
    y += (goal_y - y) * easing_y;
  }

  void display(float alp) {
    stroke(hue, sat, brt, alp);
    point(x, y);
  }
}

class Flower {
  int dot_val = (int)random(100, 300);

  Dot[] dots = new Dot[dot_val];

  float x = random(width);
  float y = random(height);
  float hue = 0;

  float alp = random(10, 255);
  float alp_spd = random(3, 6);
  float sw;

  Flower(float sw_) {
    sw = sw_;
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new Dot(hue);
    }
  }

  void display() {
    strokeWeight(sw);
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < dots.length; i++) {
      dots[i].move();
      dots[i].display(alp);
    }

    alp -= alp_spd;

    if (alp < 0) {
      x = random(width);
      y = random(height);
      hue = 255;

      for (int i = 0; i < dots.length; i++) {
        dots[i].x = 0;
        dots[i].y = 0;
      }
      alp = 255;
    }
    popMatrix();
  }
}

