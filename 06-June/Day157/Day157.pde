/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

ArrayList<ParticleSystem> systems;
import java.util.Iterator;

void setup() {
  size(500,500);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 100; i < 400; i+= 2) {
    for (int j = 100; j < 400; j+= 2) {
      systems.add(new ParticleSystem(new PVector(i,j)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#####.png");
  background(0);
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
}


