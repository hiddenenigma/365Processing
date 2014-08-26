/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 1: Vectors
http://natureofcode.com/

*/

ArrayList<Mover> movers;

void setup() {
  size(500,500);
    background(255);

  movers = new ArrayList<Mover>();
  for (int i = 0; i < 20; i++) {
    movers.add(new Mover());
  }

}

void draw() {
//  saveFrame("output/frames#################.png");
  for (Mover m: movers) {
    m.run();
  }

}
