/* Source Cited:
 
 Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com
 
 */

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


VerletPhysics2D physics;

ArrayList<Flower> flowers;

void setup() {
  size(500,500);
  smooth();
  physics = new VerletPhysics2D();
  physics.setDrag (0.1);

  physics.setWorldBounds(new Rect(-20, -20, width+40, height+40));
  flowers = new ArrayList<Flower>();
   for (int i = 0; i <100; i ++) {
     flowers.add(new Flower((int)random(20,30), random(20,50), new Vec2D(random(width), random(height))));
   }

}

void draw() {
//  saveFrame("output/frames#################.png");

  background(0);

  physics.update();
  for (Flower f: flowers) {
    f.display();
    f.showConnections();

  }
}
