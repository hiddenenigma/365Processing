/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import peasy.*;
import processing.opengl.*;

PeasyCam cam;
ArrayList<Chain> chains;
Attractor attractor;
VerletPhysics physics;
Vec3D origin;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  cam = new PeasyCam(this, 600);
  physics = new VerletPhysics();
  physics.setDrag(0.02);
  physics.addBehavior(new GravityBehavior(new Vec3D(0.001, 0.001, 0.001)));

  origin = new Vec3D();

  chains = new ArrayList<Chain>();
  for (int i = 0; i < 8; i++ ) {
    chains.add(new Chain(random(200,201), (int)random(200,201), random(5), random(0.01, 0.05)));
  }

  attractor = new Attractor(new Vec3D(0,-150,0));
  attractor.lock();
}

void draw() {
//  saveFrame("output/frame####.png");
  rotateY(frameRate * 0.01);
  background(255);
  physics.update();
  for (Chain c : chains) {
    c.display();
  }
  noFill();
  stroke(0);
  strokeWeight(1);
}


