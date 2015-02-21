/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 1 - Tutorial 23: Physics / Springs 2D
 http://www.plethora-project.com/
 
 Video tutorial: https://vimeo.com/23045361
 
*/

import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.geom.*;
import processing.opengl.*;
import peasy.*;

VerletPhysics physics;
PeasyCam cam;
Particle particles;

Creator creator;

void setup() {
  size(500,500,OPENGL);
  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(0,0,0.1)));
  cam = new PeasyCam(this, 320);
  creator = new Creator(new Vec3D());
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(0);
  noFill();
  stroke(255);
  strokeWeight(1);
  physics.update();
  drawSpring();
  creator.run();
}

void drawParticles() {
  for (int i = 0; i < physics.particles.size(); i++) {
    Particle p = (Particle) physics.particles.get(i);
    if (p.isLocked()) {
      stroke(0,0,255);
    } else {
      stroke(255,50);
    }
    p.display();
  }  
}

void drawSpring() {
  for (int i = 0; i < physics.springs.size(); i++) {
    VerletSpring sp = (VerletSpring) physics.springs.get(i);
    stroke(255,96);
    strokeWeight(1);
    line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
  }
}
