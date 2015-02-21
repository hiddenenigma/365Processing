/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import peasy.*;
import processing.opengl.*;

PeasyCam cam;
ArrayList<Chain> chains;
Attractor attractor;
VerletPhysics2D physics;
Vec3D origin;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  cam = new PeasyCam(this, 150);
  physics = new VerletPhysics2D();
  physics.setDrag(0.06);
  physics.addBehavior(new GravityBehavior(new Vec2D(0.001,0.001)));

  origin = new Vec3D();
  
  chains = new ArrayList<Chain>();
  
  for (int i = 0; i < 1; i++ ) {
    chains.add(new Chain(2000, 2000, 3, 0.1));
  }
  
  attractor = new Attractor(new Vec2D());
  attractor.lock();
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();

  for (Chain c : chains) {
    c.display();
  }
}

