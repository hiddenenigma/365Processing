// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Tree {
  ArrayList<Branch> branches;
  float theta;
  float m = 15;
  PVector loc;

  Tree(float x, float y, float theta_) {
    loc = new PVector(x,y);
    theta = theta_;
  }
  
  void display() {
    branches = new ArrayList<Branch>();    

    PVector a = new PVector(loc.x, loc.y);
    PVector b = new PVector(loc.x,loc.y-m);
    PVector c = new PVector(loc.x,loc.y+m);
    PVector d = new PVector(loc.x-m,loc.y);
    PVector e = new PVector(loc.x+m,loc.y);
    
    branches.add(new Branch(a, b, theta));
    branches.add(new Branch(a, c, theta));
    branches.add(new Branch(a, d, theta));
    branches.add(new Branch(a, e, theta));
    for (int i = 0; i < 7; i++ ) {
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
}
