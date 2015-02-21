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
ArrayList<Mesh> meshes;
Attractor a;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0, 75);
  initPhysics();
  meshes = new ArrayList<Mesh>();
  for (int i = 0; i < 75; i++) {
    meshes.add(new Mesh((int)random(1, 7), (int)random(10, 50), random(0.01, 0.05)));
  }
  a = new Attractor(new Vec2D(width/2, height/2));
}

void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  physics.update();
  for (Mesh m : meshes) {
    m.display();
  }
}

void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(0.3);
  physics.setWorldBounds(new Rect(0, 0, width, height));
}

