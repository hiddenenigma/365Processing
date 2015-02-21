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
Vec2D origin;
float radius = 125;
Attractor a;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0);
  initPhysics();
  creatures = new ArrayList<Creature>();
  for (int i = 0; i < radius; i++) {
    float angle = TWO_PI/radius * i;
    float x = cos(angle) * radius + width;
    float y = sin(angle) * radius + height/2;
    origin = new Vec2D(x/2,y);
    creatures.add(new Creature(origin, 1));
  }  
  a = new Attractor(new Vec2D(width/2, height/2));
}

void draw() {
//  saveFrame("output/frame####.tif");

  a.set(mouseX, mouseY);
  background(255);
  physics.update();
  for (Creature c : creatures) {
    c.display();
  }
}

void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(1);
}

