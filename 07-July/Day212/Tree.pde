// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Tree {
  LSystem lsys;
  Turtle turtle;
  float angle;
  float rot;
  PVector loc, vel;
  float rad;

  Tree(float x, float y, float r_) {
    angle = random(360);
    rot = r_;
    loc = new PVector(x,y);
    vel = new PVector(random(-1,1), random(-1,1));
    rad = random(5);
  }

  void display() {
    loc.add(vel);
    Rule[] ruleset = new Rule[2];
    ruleset[0] = new Rule('F', "FF[-F[+G-G]][+F[-G+G]]");
    ruleset[1] = new Rule('G', "F[-F][+F]+G");
    lsys = new LSystem("-F", ruleset);  
    turtle = new Turtle(lsys.getSentence(), 2, radians(angle), rad);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(rot);
    turtle.render();
    popMatrix();
    angle++;    
  }  
  
  void change() {

  } 
}
