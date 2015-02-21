// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Tree {
  LSystem lsys;
  Turtle turtle;
  float angle;
  float rot;
  PVector loc;
  float rad;
  float size;
  float sizeC;
  float changeA;
  int shrinkOrGrow = 1;

  Tree(float x, float y, float r_) {
    angle = 0;
    rot = r_;
    loc = new PVector(x,y);
    rad = random(0.5,2.5);
    size = 0;
    sizeC = random(0.01,0.1);
    changeA = random(0.1,1);
  }

  void display() {
    Rule[] ruleset = new Rule[1];
    ruleset[0] = new Rule('F', "F[---F-F++F][+++F+F--F]");
    lsys = new LSystem("F", ruleset);  
    turtle = new Turtle(lsys.getSentence(), size, radians(angle), rad);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(rot);
    turtle.render();
    popMatrix();
    angle+= changeA;
    changeSize();
  }  
  
  void changeSize() {
    if (size > 12) {
      shrinkOrGrow = 0;
    } else if (size < 0) {
      shrinkOrGrow = 1;
    }
  
    if (shrinkOrGrow == 1) {
      size += sizeC;
    } else if (shrinkOrGrow == 0) {
      size -= sizeC;  
    }
  } 
}
