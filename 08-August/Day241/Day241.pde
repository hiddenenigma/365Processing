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

ArrayList<Chain> chains;
float emit = 50;
float radius = 20;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0.0, 0.01)));

  chains = new ArrayList<Chain>();
  for (int i = -200; i < height; i+=25 ) {
    chains.add(new Chain(width+1,width+1,random(1,5),random(0.01,0.1),0,i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();  
  translate(0, height/3);
  for (Chain c : chains) {
    c.display();
  }
}

