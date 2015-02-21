/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
ArrayList<Repeller> repellers;

void setup() {
  size(500,500);
  background(0);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < 200; i++) {
      systems.add(new ParticleSystem(new PVector(width/2, height/2)));
  }
  
  repellers = new ArrayList<Repeller>();
  for (int i = 0; i < width+2; i+=35) {
    for (int j = 0; j < height+2; j+=35) {
      repellers.add(new Repeller(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames#####.png");
  fill(0,0);
  noStroke();
  rect(0,0,width,height);
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
    ps.applyRepeller(repellers);
  }
}


