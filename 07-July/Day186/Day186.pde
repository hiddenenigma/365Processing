/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

GOL gol;

void setup() {
  size(500,500);
  background(255);    
  frameRate(60);
  gol = new GOL();

}

void draw() {
//  saveFrame("output/frames####.png");
  gol.display();
  gol.generate();
}
