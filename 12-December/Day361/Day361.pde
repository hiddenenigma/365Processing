/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/

ArrayList<ParticleSystem> systems;
import java.util.Iterator;
float radius = 50;
float angle, theta;
int numItems = 1000;

void setup() {
  size(500, 500, OPENGL);
  smooth();
  background(255);

  systems = new ArrayList<ParticleSystem>();
  for (int i = 0; i < width; i++) {
    //   systems.add(new ParticleSystem(new PVector(width/2, height/2), random(10), random(0,255),random(5)));
  }
}

void draw() {
//  saveFrame("output/frames####.tif");

  fill(255, 25);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  for (int i = 0; i < radius; i++) {
    float angle = TWO_PI/i * radius;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    if (systems.size() < numItems) {
      systems.add(new ParticleSystem(new PVector(random(x), random(y)), random(10), random(0, 255), random(5)));
    }
  }

  Iterator<ParticleSystem> it = systems.iterator();
  while (it.hasNext ()) {
    ParticleSystem ps = it.next();
    ps.run();
    ps.addParticle();
  }
}


