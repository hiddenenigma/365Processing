/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 3: Oscillation
http://natureofcode.com/

*/

Wave [] waves = new Wave[20];
float theta = 0;

void setup() {
  size(500, 500, P3D);
  background(255);
  smooth();
  for (int i = 0; i < waves.length; i ++) {
    waves[i] = new Wave(random(-2,2), random(-2, 2), random(10), random(10), random(1,5), random(255));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

    for (int i = 0; i < waves.length; i ++) {
      waves[i].display();
  }
}


