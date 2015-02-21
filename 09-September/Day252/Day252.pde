/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 1 - Tutorial 23: Physics / Springs 2D
 http://www.plethora-project.com/
 
 Video tutorial: https://vimeo.com/23045361
 
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

Creator creator;
ArrayList<Creator> creators;

void setup() {
  size(500, 500, OPENGL);
  physics = new VerletPhysics();
  physics.setDrag(0.0001);
  physics.addBehavior(new GravityBehavior(new Vec3D(0, 0, -1)));
  cam = new PeasyCam(this, 450);
  creators = new ArrayList<Creator>();
  for (int i = -100; i < 120; i+= 20) {
    creator = new Creator(i, 0.07, i, 0);
    creators.add(creator);
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  physics.update();
  for (Creator c : creators) {
    c.run();
  }
}



