/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;

void setup() {
  size(500, 500);
  smooth();
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  //  saveFrame("output/frames####.png");
  background(0);

  Iterator<ParticleSystem> it = systems.iterator();
  
  while (it.hasNext ()) {
    ParticleSystem ps = it.next();
    ps.run();
    ps.addParticle();
    if (ps.isDead()) {
      it.remove();
    }
  }
}

void mouseDragged() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY), random(4)));
}

