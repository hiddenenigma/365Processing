/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

ArrayList<Branch> branches;
float m = 25;

float time = 0;
float increment = 0.01;

void setup() {
  size(500,500);    
}

void draw() {
//  saveFrame("output/frame#####.png");

  background(0);
 
  time += increment;

  branches = new ArrayList<Branch>();
  
  PVector a = new PVector(width/2,height+135);
  PVector b = new PVector(width/2,height-75);
  PVector c = new PVector(width/2,height/2+m);
  PVector d = new PVector(width/2-m,height/2);
  PVector e = new PVector(width/2+m,height/2);
  
  for (int i = 0; i < width; i += 20) {
    branches.add(new Branch(a, b, ((time+i)*width)));
  }

  for (int i = 0; i < 7; i++ ) {
    generate();
  }     

  for (Branch br : branches) {
    br.display();
  }
}

void generate() {
  ArrayList next = new ArrayList<Branch>();
  for (Branch br : branches) {
    
    PVector a = br.branchA();
    PVector b = br.branchB();
    PVector c = br.branchC();
    PVector d = br.branchD();

    next.add(new Branch(a, b, ((time) * random(200))));
    next.add(new Branch(b, c, ((time) * random(200))));
    next.add(new Branch(b, d, ((time) * random(200))));
  }
  branches = next;
}
