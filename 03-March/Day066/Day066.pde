/* Source Cited:
 
 Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com
 
 */

// import libraries
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
ArrayList<Cluster> clusters;
ArrayList<Particle> particles;

void setup() {
  size(500, 500);
  frameRate(24);
  physics=new VerletPhysics2D();
  physics.setDrag (0.0003);

  physics.setWorldBounds(new Rect(-25, -25, width+50, height+50));

  clusters = new ArrayList<Cluster>();
  for (int i=0; i < 250; i++) {
    clusters.add(new Cluster(2, 50, new Vec2D(width/2, height/2)));
  }
  
  particles = new ArrayList<Particle>();
  for (int i=0; i < 1; i++) {
    particles.add(new Particle(new Vec2D(random(width), random(height))));
  } 
}

void draw() {
  //  saveFrame("output2/frames#################.png");

  physics.update();
  background(255);
  // Draw the cluster.
  for (Cluster c : clusters) {
    c.showConnections();
    c.display();
  }
  
  for (Particle p : particles) {
    p.display();
  }
}

