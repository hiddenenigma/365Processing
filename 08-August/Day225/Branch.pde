class Branch {

  PVector loc, oriLoc, vel;

  int generations;
  String type;


  Branch(PVector loc_, PVector vel_, int generations_, String type_) {

    loc = loc_;
    oriLoc = loc.get();
    vel = vel_;
    generations = generations_;
    type = type_;
    updateLoc();
    updateDir();
    spawn();
  }

  void spawn() {
    if (generations > 0) {
      if (type == "A") {
        PVector l = loc.get();
        PVector v = vel.get();

        Branch newBranch = new Branch(l, v, generations-1, "B");

        branches.add(newBranch);


        PVector l2 = loc.get();
        PVector v2 = vel.get();

        Branch newBranch2 = new Branch(l2, v2, generations-1, "A");

        branches.add(newBranch2);
      }
      if (type == "B") {
        PVector l = loc.get();
        PVector v = vel.get();

        Branch newBranch = new Branch(l, v, generations-1, "A");
        branches.add(newBranch);

        PVector l2 = loc.get();
        PVector v2 = vel.get();

        Branch newBranch2 = new Branch(l2, v2, generations-1, "B");

        branches.add(newBranch2);
      }
    
//      if (type == "C") {
//        PVector l = loc.get();
//        PVector v = vel.get();
//
//        Branch newBranch = new Branch(l, v, generations-1, "A");
//        branches.add(newBranch);
//
//        PVector l2 = loc.get();
//        PVector v2 = vel.get();
//
//        Branch newBranch2 = new Branch(l2, v2, generations-1, "B");
//
//        branches.add(newBranch2);
//      }
    }    
  }

  void updateDir() {
    if (type == "A") {
      vel.rotate(radians(a1+45));
      vel.normalize();
      vel.mult(20);
    }
    if (type == "B") {
      vel.rotate(radians(-a1));
      vel.normalize();
      vel.mult(15);
    }
    
    if (type == "C") {
      vel.rotate(radians(-a1+10));
      vel.normalize();
      vel.mult(10);      
    }
  }

  void updateLoc() {
    loc.add(vel);
  }

  void display() {
    stroke(0, 15);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
    stroke(0, 5);
    strokeWeight(50);
    point(loc.x, loc.y, loc.z);   
  }
}

