/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics.behaviors.*;
import toxi.geom.*;
import processing.opengl.*;
import peasy.*;

VerletPhysics physics;
PeasyCam cam;
Particle particles;

Being being;
ArrayList<Chain> chains;
float radius = 100;
float numPoints = 25;

void setup() {
  size(500, 500, OPENGL);
  physics = new VerletPhysics();
  physics.setDrag(0.0001);
  physics.addBehavior(new GravityBehavior(new Vec3D(0.001, 0, 0)));
  cam = new PeasyCam(this, 450);
  being = new Being(200, 0, 0);
  chains = new ArrayList<Chain>();
  for (int i = 0; i < numPoints; i++ ) {
    float angle = TWO_PI/numPoints * i;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    chains.add(new Chain(200, 200, random(3, 5), random(0.1, 0.2), x, y, 0));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  physics.update();
  pushMatrix();

  translate(0, 150);

  for (Chain c : chains) {
    c.display();
  }
  being.run(); 
  popMatrix();
}

