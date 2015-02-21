/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

ArrayList<GOL> gols;

void setup() {
  size(500, 500);
  background(255);      
  frameRate(20);
  gols = new ArrayList<GOL>();
  for (int i = -50; i < width+50; i += 25) {
    for (int j = -50; j < height+50; j += 25) {
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

