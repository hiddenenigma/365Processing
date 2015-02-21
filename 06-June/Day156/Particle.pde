// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc;
  float spacing;
  float lifespan;
  
  Particle(PVector l) {
    loc = l.get();
    spacing = 250;
  }
  
  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    for (int x = 0; x < 350; x += spacing) {
      for (int y = 0; y < 350; y += spacing) {
        point(x,y);
      }
    }
    spacing --;
    popMatrix();
  }
}
