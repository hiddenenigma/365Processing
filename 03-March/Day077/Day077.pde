/* Source Cited:
 
 Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com
 
 Toxiclib Library Example
 Draggable Particles
 
*/


//import libraries
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

import java.util.Iterator;

VerletPhysics2D physics;
ArrayList <Cluster> clusters;
ArrayList <Particle> particles;
ArrayList <Particle> particles2;
//Particle p3;

void setup() {
  size(500, 500);

  smooth();
  physics = new VerletPhysics2D();
  physics.setDrag (0.05);

  physics.setWorldBounds(new Rect(-2,-5,width+4,height+10));
  clusters = new ArrayList<Cluster>();
  for (int i = 0; i < 10; i ++) {
  clusters.add(new Cluster(new Vec2D(random(width), random(height))));
  }
  particles = new ArrayList<Particle>();
  particles2 = new ArrayList<Particle>();

  for (int i = 0; i < width; i ++) {
  particles.add(new Particle(new Vec2D(i, -5), 1));
  }
  for (int i = 0; i < width; i ++) {
  particles2.add(new Particle(new Vec2D(i, height+5), 1));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  background(255);
  physics.update();
  for (Cluster c: clusters) {
    c.display();
  }
}
  
 
 
