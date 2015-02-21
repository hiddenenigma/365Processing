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
  frameRate(10);
  int[] ruleset = {0,1,0,1,1,0,1,0};
  ca = new CA(ruleset);
}

void draw() {
//  saveFrame("output/frames####.png");
  
  ca.display();
  ca.generate();
  
  if (ca.finished()) {
    delay++;
    if (delay > 15) {
      background(255);
      ca.randomize();
      ca.restart();
      delay = 0;
    }
  }
}

