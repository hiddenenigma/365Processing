/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 3: Oscillation
http://natureofcode.com/

*/

Wave [] waves = new Wave[20];

void setup() {
  size(500, 500);
  for (int i = 0; i < waves.length; i ++) {
    waves[i] = new Wave(random(-2, 2), random(-2, 2), random(6), random(10), random(1, 5));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  background(255);
  for (int i = 0; i < waves.length; i ++) {
    waves[i].display();
  }
}


