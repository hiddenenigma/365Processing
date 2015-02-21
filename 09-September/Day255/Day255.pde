import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.geom.*;

VerletPhysics2D physics;
Particle particle;

ArrayList<Particle> particles;
int numParticles = 1200;
Attractor attractor;

ArrayList<Attractor> attractors;

void setup() {
  size(500, 500);
  physics = new VerletPhysics2D();
  physics.setDrag(0.25);
  physics.setWorldBounds(new Rect(-25, -25, width+50, height+50));
  particles = new ArrayList<Particle>();
  attractors = new ArrayList<Attractor>();
  for (int i = 0; i < 1; i++) {
    attractor = new Attractor(new Vec2D(width/2, height/2));
    attractor.lock();
    physics.addParticle(attractor);
    attractors.add(attractor);
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  physics.update();
  if (particles.size() < numParticles) {
    addParticle();
  }
  for (Particle p : particles) {
    p.display();
  }
}

void addParticle() {
  particle = new Particle(new Vec2D(random(width), random(height)), random(5));
  physics.addParticle(particle);
  particles.add(particle);
}

