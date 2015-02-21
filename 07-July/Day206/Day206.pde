/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

ArrayList<Branch> branches;
float theta = 0;
float m = 1;

void setup() {
  size(500,500);
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(0);
  
  branches = new ArrayList<Branch>();
  
  PVector a = new PVector(width/2,height/2);
  PVector b = new PVector(width/2,height/2-m);
  PVector c = new PVector(width/2,height/2+m);
  PVector d = new PVector(width/2-m,height/2);
  PVector e = new PVector(width/2+m,height/2);
  
  branches.add(new Branch(a, b, theta));
  branches.add(new Branch(a, c, theta));
  branches.add(new Branch(a, d, theta));
  branches.add(new Branch(a, e, theta));
  
  for (int i = 0; i < 8; i++ ) {
    generate();
  }   
  
  for (Branch br : branches) {
    br.display();
  }
  theta++;
}


void generate() {
  ArrayList next = new ArrayList<Branch>();
  for (Branch br : branches) {
    
    PVector a = br.branchA();
    PVector b = br.branchB();
    PVector c = br.branchC();
    PVector d = br.branchD();

    next.add(new Branch(a, b, theta));
    next.add(new Branch(b, c, theta));
    next.add(new Branch(b, d, theta));
    
  }
  
  branches = next;
  
}
