/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

ArrayList<GOL> gols;

void setup() {
  size(500, 500);
  background(255);      
  gols = new ArrayList<GOL>();
}

void draw() {

//  saveFrame("output/frames####.png");
  for (GOL gol : gols) {
    gol.display();
    gol.generate();
  }
}

void mouseDragged() {
  gols.add(new GOL(mouseX, mouseY, random(-0.1, 0.1)));
}
