/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

CA ca;
ArrayList<CA> cas;
float theta = 0;

void setup() {
  size(500,500);
  smooth();
  background(255);
  int[] ruleset = {(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2)}; // random ruleset
  ca = new CA(ruleset);
  cas = new ArrayList<CA>();
  for (int i = 0; i < 10; i++) {
    cas.add(new CA(ruleset));
  }
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
  theta+= 0.5;
  popMatrix();  
}



