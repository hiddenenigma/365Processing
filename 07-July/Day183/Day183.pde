/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

CA ca;
float theta = 0;

void setup() {
  size(500,500);
  smooth();
  background(255);
  int[] ruleset = {(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2)}; // random ruleset
  ca = new CA(ruleset);
}

void draw() {
//  saveFrame("output/frames####.png");

  pushMatrix();
  translate(width/2, height/2);  
  rotate(theta);  
  ca.display();
  ca.generate();
  if (ca.finished()) {
    setup();
  }
  theta+= 0.1;
  popMatrix();  
}



