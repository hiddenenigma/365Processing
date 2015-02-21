class Tree {
  LSystem lsys;
  Turtle turtle;
  float angle;
  float rot;
  PVector loc;

  Tree(float x, float y, float r_) {
    angle = 0;
    rot = r_;
    loc = new PVector(x,y);
  }

  void display() {
    Rule[] ruleset = new Rule[1];
    ruleset[0] = new Rule('F', "F[-F-F][FF][+F+F]");
    lsys = new LSystem("-F-F+F-F", ruleset);  
    turtle = new Turtle(lsys.getSentence(), 25, radians(angle), 50);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(rot);
    turtle.render();
    popMatrix();
    angle++;    
  }  
}
