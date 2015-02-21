/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/


ArrayList<KochLine> lines;
float r = 180;

void setup() {
  size(500,500);
  smooth(8);
 
}

void draw() {
//  saveFrame("output/frames####.png");
  background(0);

  lines = new ArrayList<KochLine>();
  PVector a = new PVector(100,160);
  PVector b = new PVector(width-100, 160);
  PVector c = new PVector(width/2, width*cos(radians(30)));
  
  lines.add(new KochLine(a,b,r));
  lines.add(new KochLine(b,c,r));
  lines.add(new KochLine(c,a,r));

  for (int i = 0; i < 5; i++) {    
    generate();
  }  
  for (KochLine l : lines) {
    l.display();
  }
  r++;
}

void generate() {
  ArrayList next = new ArrayList<KochLine>();
  for (KochLine l : lines) {
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();

    next.add(new KochLine(a, b, r));
    next.add(new KochLine(b, c, r));
    next.add(new KochLine(c, d, r));
    next.add(new KochLine(d, e, r));
  }
  lines = next;
}
