/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import processing.opengl.*;

VerletPhysics2D physics;
ArrayList<Attractor> attractors;
Attractor attractor;
ArrayList<Chain> chains;
float emit = 50;
float radius = 20;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0.0, 0.005)));
  chains = new ArrayList<Chain>();
  attractors = new ArrayList<Attractor>();
  for (int i = 0; i < height; i+= 5) {
    chains.add(new Chain(width+1,width+1,random(1,5),0.2,0,i));
  }
  for (int i = 0; i < 20; i++ ) {
    attractor = new Attractor(new Vec2D(random(width), random(height)), random(1,5));
    attractors.add(attractor);
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();  
  for (Chain c : chains) {
    c.display();
    c.borders();
  }
}
