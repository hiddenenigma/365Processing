// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Confetti extends Particle {

  float mass;
  float m;
  
  Confetti(PVector l, float m_) {
    super(l);
    mass = 0.1;
    m = m_;
  }

  // There is no code here because we inherit update() from parent.


  //[full] Override the display method.
  void display() {
    mass+= 0.15;
    float theta = map(loc.x,0,width,0,TWO_PI*2);
    float c = map(loc.y,height,0,0,255);
    fill(c);
    strokeWeight(1);
    stroke(0,lifespan);
    //[full] If we rotate() a shape in Processing, we need to familiarize ourselves with transformations. For more, visit: http://processing.org/learning/transform2d/
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    rect(0,0,mass-m,mass+m);
    popMatrix();
    //[end]
  }
}
