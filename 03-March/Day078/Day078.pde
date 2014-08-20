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


void setup() {
  size(500, 500);
  smooth();
  physics = new VerletPhysics2D();
  physics.setDrag (0.8);
  physics.setWorldBounds(new Rect(-2,-5,width+4,height+10));
  clusters = new ArrayList<Cluster>();
  for (int i = 0; i < 8; i ++) {
    clusters.add(new Cluster(new Vec2D(width/2, height/2)));
  }
}

void draw() {
//  saveFrame("output3/frames#################.png");

  background(255);
  physics.update();
  for (Cluster c: clusters) {
    c.display();
  }
}
  
 
 
