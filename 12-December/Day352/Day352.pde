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
Repeller r;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0, 50);
  initPhysics();
  meshes = new ArrayList<Mesh>();

  for (int i = 0; i < 55; i++) {
    meshes.add(new Mesh((int)random(2, 3), (int)random(10, 15), random(2), random(0.01, 0.05)));
  }
  a = new Attractor(new Vec2D(width/2, height/2));
  r= new Repeller(new Vec2D(-5000, -5000));
}

void draw() {
  //  saveFrame("output/frame####.tif");

  background(255);
  a.set(mouseX, mouseY);
  physics.update();
  for (Mesh m : meshes) {
    m.display();
  }
}

void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(1);
}

void mousePressed() {
  a.set(-5000, -5000);
  r.set(mouseX, mouseY);
}

void mouseReleased() {
  a.set(mouseX, mouseY);
  r.set(-5000, -5000);
}

