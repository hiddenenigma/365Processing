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
  for (int i = -50; i < width+50; i += 50) {
    for (int j = -50; j < height+50; j += 50) {
      gols.add(new GOL(i,j,random(-0.05,0.05)));
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
