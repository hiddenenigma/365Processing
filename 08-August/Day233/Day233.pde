/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/
 
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import toxi.geom.*;
import processing.opengl.*;
import peasy.*;

PeasyCam cam;

SphereConstraint sc;
Particle particles;
VerletPhysics physics;
Attractor attractor;

Chain chain;

ArrayList<Chain> chains;


void setup() {
  size(500, 500, OPENGL);
  smooth(8);

  cam = new PeasyCam(this, 700);

  physics = new VerletPhysics();
  physics.setDrag (0.01);
  
  physics.addBehavior(new GravityBehavior(new Vec3D(0.001,0,0)));

  sc = new SphereConstraint(new Vec3D(), 275, SphereConstraint.INSIDE);
  chains = new ArrayList<Chain>();
  attractor = new Attractor(new Vec3D(0,0,0));
  for (int i = 0; i < 60; i++) {
    chain = new Chain(random(100), (int)random(5,75), random(2,15), random(0.1,0.5));  
    chains.add(chain);
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  physics.update();
  
  background(255);
  strokeWeight(20);
  for (Chain c : chains) {
    c.display();
  }

}


