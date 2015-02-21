/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

ArrayList<GOL> gols;

void setup() {
  size(500, 500);
  frameRate(40);
  background(255);      

  gols = new ArrayList<GOL>();
  for (int j = -50; j < height+50; j += 1) {
    gols.add(new GOL(0,j));
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  for (GOL gol : gols) {
    gol.display(gols);
    gol.generate();
  }
}


