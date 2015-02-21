/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.geom.*;
import peasy.*;

PeasyCam cam;
VerletPhysics physics;

ArrayList<Creature> creatures;

void setup() {
  size(500, 500, P3D);  
  smooth(8);
  cam = new PeasyCam(this, 250);
  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(0.1,0.1,0)));
  creatures = new ArrayList<Creature>();
  for (int i = 0; i < 200; i += 20) {  
    creatures.add(new Creature(i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  
  physics.update();
  for (Creature c : creatures) {
    c.display();
  }
}

