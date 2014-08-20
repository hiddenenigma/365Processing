/* Source Cited:
 
 Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com
 
*/

//import libraries
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;


VerletPhysics2D physics;

ArrayList<Creature> creatures;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  physics = new VerletPhysics2D();
  physics.setDrag (0.1);

  physics.setWorldBounds(new Rect(-20, -20, width+40, height+40));
  creatures = new ArrayList<Creature>();
  for (int i = 0; i <20; i ++) {
    creatures.add(new Creature(30, 50, new Vec2D(random(width), random(height))));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  physics.update();

  for (Creature c : creatures) {
    c.display();
    c.showConnections();
  }
}
