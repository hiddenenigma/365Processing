/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;

void setup() {
  size(500,500);
  background(0);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < width; i+=10) {
      systems.add(new ParticleSystem(new PVector(width/2,height/2)));
  }
}

void draw() {
//  saveFrame("output/frames#####.png");
  fill(0,50);
  noStroke();
  rect(0,0,width,height);
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
}

