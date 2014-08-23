/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
Repeller repeller;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < width; i +=50) {
    systems.add(new ParticleSystem(new PVector(width/2, height/2)));
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(255);
  repeller = new Repeller(new PVector(mouseX, mouseY));

  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
    ps.applyRepeller(repeller);
  }
 repeller.display();
}

