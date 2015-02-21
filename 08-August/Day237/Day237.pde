/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
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
  cam = new PeasyCam(this, 255);
  physics = new VerletPhysics();
  origin = new Vec3D();
  chains = new ArrayList<Chain>();
  for (int i = -250; i < 250; i+=5 ) {
    chains.add(new Chain(height, height, random(3,5), random(0.1,0.2), i, 0));
  }
 
  attractor = new Attractor(new Vec3D(0, 0, 0));
  attractor.lock();
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();
  for (Chain c : chains) {
    c.display();
  }
  attractor.display();
}


  

