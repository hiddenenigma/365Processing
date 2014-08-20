/* Source Cited:
 
 Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com
 
 */

// import libraries
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;


VerletPhysics2D physics;
Cluster cluster;

ArrayList<Particle> particles;


void setup() {
  size(500, 500);
  //  frameRate(30);
  physics=new VerletPhysics2D();
  physics.setDrag (0.001);

  physics.setWorldBounds(new Rect(-20, -20, width+40, height+40));

  //[offset-down] Make a cluster.
  cluster = new Cluster(200, 150, new Vec2D(width/2, height/2));
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 2000; i++) {
    particles.add(new Particle(new Vec2D(random(width), random(height)), random(.1, 2)));
  }
}

void draw() {
  //  saveFrame("output2/frames#################.png");

  physics.update();
  background(255);
  // Draw the cluster.
  cluster.showConnections();
  cluster.display();
  for (Particle p : particles) {
    p.display();
    if (mousePressed) {
      p.lock();
      p.set(mouseX, mouseY);
    } else {
      p.unlock();
    }
  }
}
