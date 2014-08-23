// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Confetti extends Particle {

  // We could add variables for only Confetti here.
  float angle = 0;
  float size;
  float m;
  
  Confetti(PVector l, float size_, float m_) {
    super(l);
    size = size_;
    m = m_;
  }

  // There is no code here because we inherit update() from parent.


  //[full] Override the display method.
  void display() {
    float theta = map(loc.x,0,width,0,PI);
    float c = map(loc.y,0,height,0,255);
    fill(255,lifespan);
    noStroke();
//    strokeWeight(1);
//    stroke(0,lifespan);
    //[full] If we rotate() a shape in Processing, we need to familiarize ourselves with transformations. For more, visit: http://processing.org/learning/transform2d/
//    pushMatrix();
//    translate(loc.x+100,loc.y+100);
//    rotate(theta);
//    ellipse(loc.x,loc.y,mass,mass);
//    popMatrix();
    //[end]
    angle += 0;
    float val = cos(radians(angle)) * size;
    for (int a = 0; a < 360; a +=5) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      ellipse(loc.x + xoff, loc.y + yoff, m,m);
    }
  }
}
