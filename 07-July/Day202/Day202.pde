/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/


ArrayList<KochLine> lines;

void setup() {
  size(500, 500);
  lines = new ArrayList<KochLine>();
  for (int i = -50; i < width+150; i += 150) {
    for (int j = -50; j < height+150; j += 150) {
      PVector a = new PVector(i, j);
      PVector b = new PVector(width/2, height/2);
      lines.add(new KochLine(a, b, random(255)));
    }
  }
  for (int i = 0; i < 6; i++) {
    generate();
  }
}

void draw() {
  //  saveFrame("output/frames####.png");

  background(255);
  for (KochLine l : lines) {
    l.display();
  }
}

void generate() {
  ArrayList next = new ArrayList<KochLine>();
  for (KochLine l : lines) {

    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();

    next.add(new KochLine(a, b, random(255)));
    next.add(new KochLine(b, c, random(255)));
    next.add(new KochLine(c, d, random(255)));
    next.add(new KochLine(d, e, random(255)));
  }
  lines = next;
}

