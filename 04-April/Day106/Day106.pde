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
    background(255);

  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < width; i +=5) {
//    for(int j = 0; j < height+20; j += 5) {
      systems.add(new ParticleSystem(new PVector(width/2,random(height))));
//    }
  }

  
}

void draw() {
//  saveFrame("output/frames#################.tif");

      repeller = new Repeller(new PVector(mouseX, mouseY));

  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
    ps.applyRepeller(repeller);
  }

      repeller.display();
  
}

void mousePressed() {
}

