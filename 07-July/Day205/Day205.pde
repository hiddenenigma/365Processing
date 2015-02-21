/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/


ArrayList<Diamond> diamonds;
float t = 0;

void setup() {
  size(500,500);
}

void draw() {
//  saveFrame("output/frame#######.png");
  background(0);
  diamonds = new ArrayList<Diamond>();
  
  PVector a = new PVector(75, height/2);
  PVector b = new PVector(width/2, 75);
  PVector c = new PVector(width-75, height/2);
  PVector e = new PVector(width/2, height-75);
  
  diamonds.add(new Diamond(b,a,t));
  diamonds.add(new Diamond(c,b,t));
  diamonds.add(new Diamond(e,c,t));
  diamonds.add(new Diamond(a,e,t));
  
  for (int i = 0; i < 4; i++ ) {
    generate();
  }    
  for (Diamond d : diamonds) {
    d.display();
  }
  t++;
}

void generate() {
  ArrayList next = new ArrayList<Diamond>();
  for (Diamond x : diamonds) {

    PVector a = x.diamondA();
    PVector b = x.diamondB();
    PVector c = x.diamondC();
    PVector d = x.diamondD();
    PVector e = x.diamondE();
    PVector f = x.diamondF();

    next.add(new Diamond(a, b,t));
    next.add(new Diamond(b, c,t));
    next.add(new Diamond(c, d,t));
    next.add(new Diamond(d, e,t));
    next.add(new Diamond(e, b,t));
    next.add(new Diamond(b, f,t));
    
  }
  
  diamonds = next;
  
}
