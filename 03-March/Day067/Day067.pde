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

ArrayList<Particle> particles;
ArrayList<Cluster> clusters;


void setup() {
  size(500, 500);
  background(0);

  //  frameRate(30);
  physics=new VerletPhysics2D();
  physics.setDrag (0.00001);

  physics.setWorldBounds(new Rect(-30, -30, width+60, height+60));

  //[offset-down] Make a cluster.
  clusters = new ArrayList<Cluster>();
  for (int i = 0; i < 30; i++) {
    clusters.add(new Cluster(10, random(5), new Vec2D(width/2, height/2)));
  }


  particles = new ArrayList<Particle>();
  for (int i = 0; i < 50; i++) {
    particles.add(new Particle(new Vec2D(random(width), random(height)), random(.1, 2)));
  }
}

void draw() {
  //  saveFrame("output/frames#################.png");
  physics.update();
  // Draw the cluster.
  for (Cluster c : clusters) {
    c.showConnections();
    c.display();
  }
  for (Particle p : particles) {
    p.display();
  }
}
