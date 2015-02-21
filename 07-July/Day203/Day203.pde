/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

ArrayList<KochLine> lines;
float theta = 0;

void setup() {
  size(500, 500);
  lines = new ArrayList<KochLine>();

  PVector a = new PVector(-250, 0);
  PVector b = new PVector(0, 250);
  PVector c = new PVector(-500, 0);
  PVector d = new PVector(0, 0);
  PVector e = new PVector(-250, -250);
  PVector f = new PVector(250, 0);
  PVector g = new PVector(250, 500);
  PVector h = new PVector(0, -250);

  lines.add(new KochLine(e, b));
  lines.add(new KochLine(a, d));
  lines.add(new KochLine(e, f));
  lines.add(new KochLine(a, d));
  lines.add(new KochLine(d, b));
  lines.add(new KochLine(d, a));
  lines.add(new KochLine(d, g));
  lines.add(new KochLine(a, h));

  for (int i = 0; i < 8; i++) {
    generate();
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  translate(width/2, height/2);
  rotate(theta);
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

    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }

  lines = next;
}

