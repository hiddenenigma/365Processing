/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

*/

ArrayList<ParticleSystem> systems;
import java.util.Iterator;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  noStroke();

  systems = new ArrayList<ParticleSystem>();
  systems.add(new ParticleSystem(new PVector(width/2, height/2)));
}

void draw() {
//  saveFrame("output/frames#####.tif");
  fill(0, 20);
  rect(0, 0, width, height);
  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
}


