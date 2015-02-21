/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 7: Cellular Automata
http://natureofcode.com/

*/

ArrayList<GOL> gols;

void setup() {
  size(500, 500);

  frameRate(40);
  gols = new ArrayList<GOL>();
  for (int i = -10; i < width+10; i += 50) {
    for (int j = -10; j < height+20; j += 50) {
      gols.add(new GOL(i,j,random(3)));
    }
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  background(255);      
  for (GOL gol : gols) {
    gol.display(gols);
    gol.generate();
  }
}
