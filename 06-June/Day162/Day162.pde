/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;

int emit =250;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 1; i <= emit; i++) {
    for (int j = 0; j < 200; j += 20) {
      float angle = i * TWO_PI / emit;
      float x = width/2 + cos(angle) * j;
      float y = height/2 + sin(angle) * j;
      systems.add(new ParticleSystem(new PVector(x, y)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#####.png");

  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
}

