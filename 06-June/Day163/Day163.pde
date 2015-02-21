/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/

ArrayList<ParticleSystem> systems;

import java.util.Iterator;

void setup() {
  size(500,500);
  background(0);
  smooth();
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
//  saveFrame("output/frames#####.png");
  Iterator<ParticleSystem> it = systems.iterator();
  while(it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.run();
    ps.addParticle();
    if (ps.isDead()) {
      it.remove();
    }
  }

}

void mouseDragged() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY), random(4,10)));
}


