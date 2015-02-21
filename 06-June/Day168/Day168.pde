/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
int emit =120;

void setup() {
  size(500,500);
  smooth();
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
//  saveFrame("output/frames####.png");
  background(0);

  float r = map(mouseY,0,height,1,200);
  for (int i = 1; i <= emit; i++) {
    float angle = i * TWO_PI / emit;
    float x = width/2 + cos(angle) * r;
    float y = height/2 + sin(angle) * r;
    systems.add(new ParticleSystem(new PVector(x,y)));
  }
  
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


