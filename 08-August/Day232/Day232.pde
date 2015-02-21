/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 2 - Tutorial 02: L-Systems
 http://www.plethora-project.com/
 Video tutorial: http://vimeo.com/22984904
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.geom.*;
import processing.opengl.*; 

VerletPhysics physics;
Attractor attractor;
ArrayList<Chain> chains;
Chain chain;
Vec3D l;
Vec3D initVel;
float a = 0;
float a1 = radians(0);
float a2 = radians(0);
float a3 = radians(0);

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(-0.01, -0.01, -0.01)));
  chains = new ArrayList<Chain>();
  for (int i = 0; i < 3; i++ ) {
    l = new Vec3D(0, 0, 0);
    initVel = new Vec3D(i, 0, 0);
    chain = new Chain(l, initVel, 0, "A", random(400, 500), 400, random(5), random(0.1, 0.5));
    chains.add(chain);
  }  
  attractor = new Attractor(new Vec3D(width/2, height/2, 0));
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();  
  for (Chain c : chains) {
    c.display();
  }
  a1++;
  a2++;
  a3++;
}

