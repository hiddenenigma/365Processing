/* Source Cited:

Nature of Code by Daniel Shiffman
Chapter 5: Physics Libraries
http://natureofcode.com

*/

// import libraries
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
 
ArrayList<Particle> particles;
ArrayList<Attractor> attractors;

VerletPhysics2D physics;

void setup () {
  size (500, 500);
  background(255);  

  physics = new VerletPhysics2D ();
  physics.setDrag (0.02);
  physics.setWorldBounds(new Rect(-50, -50, width+100, height+100));
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 1000; i++) {
    particles.add(new Particle(new Vec2D(random(width),random(height)), .5));
  }
  attractors = new ArrayList<Attractor>();
  for (int i = 0; i < 10; i++) {
    attractors.add(new Attractor(new Vec2D(random(width), random(height)), random(10,20)));
  }
}


void draw () {
//  saveFrame("output/frames#################.tif");

  physics.update();

  for (Particle p: particles) {
    p.display();
  }
}
