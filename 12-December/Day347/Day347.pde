/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 5: Physics Library
http://natureofcode.com/

SoftBodySquareAdapted Example
https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp5_physicslibraries/toxiclibs/Exercise_5_13_SoftBodySquareAdapted

*/

import processing.opengl.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;
ArrayList<Creature> creatures;
Attractor a;
Vec2D origin;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0, 50);
  initPhysics();
  creatures = new ArrayList<Creature>();
  for (int i = 0; i < 10; i+= 1) {
    origin = new Vec2D(random(width), random(50,100));
    creatures.add(new Creature(origin, 10));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");
  background(255);
  physics.update();
  for (Creature c : creatures) {
    c.display();
  }
}

void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(1.5);
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.1)));
}

