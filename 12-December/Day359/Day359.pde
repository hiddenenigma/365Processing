/* Source Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 4: Particle Systems
 http://natureofcode.com/
 
*/

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
float radius = 5;
float angle, theta;

void setup() {
  size(500, 500, OPENGL);
  smooth();
  background(0);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
//  saveFrame("output/frames####.tif");
  fill(0, 75);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  rotate(theta);
  for (int i = 0; i < radius; i++) {
    float angle = TWO_PI/i * radius;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    if (radius <= 125) {
      systems.add(new ParticleSystem(new PVector(x, y), 25, 1));
      radius += 0.02;
    }
  }

  Iterator<ParticleSystem> it = systems.iterator();
  while (it.hasNext ()) {
    ParticleSystem ps = it.next();
    ps.run();
    ps.addParticle();
  }

  angle+=0.01;
  theta+= 0.001;
}

