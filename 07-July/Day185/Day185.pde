/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

ArrayList<CA> cas;
float theta = 0;

void setup() {
  size(500,500);
  smooth();
  background(255);
  int[] ruleset = {(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2)}; // random ruleset
  cas = new ArrayList<CA>();
}

void draw() {
//  saveFrame("output/frames####.png");
  pushMatrix();
  translate(width/2, height/2);  
  rotate(theta);  
  for (CA ca: cas) {
    ca.display();
    ca.generate();
  }
  theta+= 0.1;
  popMatrix();

}

void mousePressed() {
  int[] ruleset = {(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2),(int)random(2)}; // random ruleset
  cas.add(new CA(ruleset, width/2, height/2, 20));
}



