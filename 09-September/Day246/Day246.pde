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

VerletPhysics physics;
Particle particles;

Creator creator;

void setup() {
  size(500,500,OPENGL);
  physics = new VerletPhysics();
  physics.setDrag(0.0001);
  physics.addBehavior(new GravityBehavior(new Vec3D(0,0,0.0005)));
  creator = new Creator(new Vec3D());
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(0);
  physics.update();
  drawParticles();
  drawSpring();
  creator.run();
}

void drawParticles() {
  for (int i = 0; i < physics.particles.size(); i++) {
    Particle p = (Particle) physics.particles.get(i);
    p.display();
  }  
}

void drawSpring() {
  for (int i = 0; i < physics.springs.size(); i++) {
    VerletSpring sp = (VerletSpring) physics.springs.get(i);
    stroke(255,98);
    strokeWeight(1);
    line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
  }
}
