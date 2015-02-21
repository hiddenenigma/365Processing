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
float radius = 50;
Attractor a;
Repeller r;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0);
  initPhysics();
  creatures = new ArrayList<Creature>();
  for (int i = 0; i < width; i+=2) {
    origin = new Vec2D(random(width), height/1.5);
    creatures.add(new Creature(origin, random(3)));
  }
  a = new Attractor(new Vec2D(width/2, height/2));
  r= new Repeller(new Vec2D(-100, -100));
}

void draw() {
  //  saveFrame("output/frame####.tif");

  background(255);
  physics.update();
  a.set(mouseX, mouseY);

  for (Creature c : creatures) {
    c.display();
  }
}

void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(1);
}

void mousePressed() {
  a.set(-100, -100);
  r.set(mouseX, mouseY);
}

void mouseReleased() {
  a.set(mouseX, mouseY);
  r.set(-100, -100);
}

