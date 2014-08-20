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


void setup() {
  size(500, 500);
  physics=new VerletPhysics2D();
  physics.setDrag (0.1);
  //[offset-down] Make a cluster.
  physics.setWorldBounds(new Rect(-20,-20, width+40, height+40));
  clusters = new ArrayList<Cluster>();
  for (int i = 0; i < 40; i++) {
  clusters.add( new Cluster((int)random(3,10),100,30,new Vec2D(random(50, width-50), random(50, height-50))));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  physics.update();
  background(255);
  // Draw the cluster.
  for (Cluster c: clusters) {
    c.display();
    c.showConnections();
  }
}
