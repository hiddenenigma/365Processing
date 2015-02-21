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
  for (int i = -10; i < width+300; i += 100) {
    for (int j = -10; j < height+300; j += 100) {
      gols.add(new GOL(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames####.png");

  for (GOL gol : gols) {
    gol.display();
    gol.generate();
  }
}

