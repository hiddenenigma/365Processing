/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
Repeller[] repellers = new Repeller[5];

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  background(0);

  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < 500; i ++) {
    systems.add(new ParticleSystem(new PVector(width/2,height/2)));
  }
  
  for (int i = 0; i < repellers.length; i ++ ) {
    repellers[i] = new Repeller(new PVector(width/2,height/2));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  fill(0);
  rect(0,0,width,height);
  for (int i = 0; i < repellers.length; i ++) {
    repellers[i].display();
    for (ParticleSystem ps: systems) {
      ps.run();
      ps.addParticle();
      ps.applyRepeller(repellers[i]);
    }
  }
}

