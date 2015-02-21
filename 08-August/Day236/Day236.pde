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
  
  chains = new ArrayList<Chain>();
  attractors = new ArrayList<Attractor>();
  for (int i = 0; i < width; i+= 5) {
    chains.add(new Chain(width+1,width+1,random(1,5),0.02,0,i));
  }
  for (int i = 0; i < 300; i++ ) {
    attractor = new Attractor(new Vec2D(random(width), random(height)), random(1,5));
    attractor.lock();
    attractors.add(attractor);
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();  
  for (Chain c : chains) {
    c.display();
  }
}

