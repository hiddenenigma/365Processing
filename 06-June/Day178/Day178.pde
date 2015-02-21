/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

CA ca;
int delay = 0;

void setup() {
  size(500,500);
  background(255);
  frameRate(15);
  int[] ruleset = {(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2)};
  ca = new CA(ruleset, width,0);
}

void draw() {
//  saveFrame("output/frames####.png");
  ca.display();
  ca.generate();
  ca.update();
  if (ca.finished()) {
    delay++;
    if (delay > 5) {
      ca.randomize();
      ca.restart();
      delay = 0;
    }
  }
}

