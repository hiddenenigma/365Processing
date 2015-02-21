/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

ArrayList<ParticleSystem> systems;
import java.util.Iterator;

void setup() {
  size(500, 500);
  smooth();
  stroke(255);
  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < width; i+= 25) {
    for (int j = 0; j < height; j+= 25) {
      systems.add(new ParticleSystem(new PVector(i, j)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#####.png");
  background(0);
  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
}

