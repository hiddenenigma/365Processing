/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < 50; i ++) {
      systems.add(new ParticleSystem(new PVector(random(width), random(height))));
  }  
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);

  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
    ps.checkEdges();
  }
}
