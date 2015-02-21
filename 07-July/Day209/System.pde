// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class System {
  LSystem lsys;
  Turtle turtle;
  float angle = radians(25);
  PVector loc;
  float r;
  
  System(float x, float y, float r_) {
    loc = new PVector(x,y);
    r = r_;
    Rule[] ruleset = new Rule[1];
    ruleset[0] = new Rule('F', "FF+[+F-F-F]-[-F+F+F]");
    lsys = new LSystem("F", ruleset);  
    turtle = new Turtle(lsys.getSentence(), height, angle);  
    for (int i = 0; i < 5; i++) {
      lsys.generate();
    }    
  }
  
  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(r);
    turtle.render();
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(0.5);
    popMatrix();
  }
}
