// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Tree {
  LSystem lsys;
  Turtle turtle;
  float angle;
  float rot;
  PVector loc;

  Tree(float x, float y, float r_) {
    angle = 15;
    rot = r_;
    loc = new PVector(x,y);
  }

  void display() {
    Rule[] ruleset = new Rule[1];
    ruleset[0] = new Rule('F', "FF[+F+F+F+F+F-F][-F-F-F-F-F+F]");
    lsys = new LSystem("+F", ruleset);  
    turtle = new Turtle(lsys.getSentence(), 5, radians(angle), 10);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(rot);
    turtle.render();
    popMatrix();
    angle+=0.5;    
  }  
  
  void change() {

  } 
}
