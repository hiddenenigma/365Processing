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
ArrayList<Attractor> attractors;
Attractor attractor;
VerletPhysics physics;
Vec3D origin;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(0.000001, -0.01, 0))); 

  origin = new Vec3D();

  chains = new ArrayList<Chain>();
  for (int i = -5; i < 5; i+=1) {
    chains.add(new Chain(height+200, height+200, 2, random(1), i, 0));
  }
  attractors = new ArrayList<Attractor>();
  for (int i = 0; i <1; i+=1 ) { 
    attractor = new Attractor(new Vec3D(0,250,0));
    attractor.lock();
    attractors.add(attractor);
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();
  Vec3D follow = new Vec3D(mouseX-250,mouseY-250,0);
  pushMatrix();
  translate(width/2, height/2-50);
  for (Chain c : chains) {
    c.display();
  }
  popMatrix();
}

