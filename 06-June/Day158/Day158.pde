/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/


ArrayList<ParticleSystem> systems;
import java.util.Iterator;

int emit =250;

void setup() {
  size(500, 500);
  smooth();
  systems = new ArrayList<ParticleSystem>();
  for (int i = 1; i <= emit; i++) {
    float angle = i * TWO_PI / emit;
    float x = width/2 + cos(angle) * 150;
    float y = height/2 + sin(angle) * 150;
    systems.add(new ParticleSystem(new PVector(x, y)));
  }
}

void draw() {
//  saveFrame("output/frames#####.png");
  background(0);

  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
}
