/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
ArrayList<Repeller> repellers;
int emit =10;

void setup() {
  size(500,500);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 1; i < width+10; i+= emit) {
    for (int j = 1; j < height+10; j+= emit) {
    systems.add(new ParticleSystem(new PVector(i, j)));
    }
  }
  repellers = new ArrayList<Repeller>();
  repellers.add(new Repeller(width/2,height/2));
}

void draw() {
//  saveFrame("output/frames####.png");
  background(255);

  Iterator<ParticleSystem> it = systems.iterator();
  while(it.hasNext()) {
    ParticleSystem ps = it.next();
    ps.run();
    ps.addParticle();
    ps.applyRepeller(repellers);
    if (ps.isDead()) {
      it.remove();
    }
  }
}

