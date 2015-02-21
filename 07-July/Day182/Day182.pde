/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

CA ca;

void setup() {
  size(500,500);
  smooth();
  background(255);
  int[] ruleset = {(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2)}; // random ruleset
  ca = new CA(ruleset);
}

void draw() {
//  saveFrame("output/frames####.png");

  ca.display();
  ca.generate(); 
  if (ca.finished()) {
    setup();
  }
}



