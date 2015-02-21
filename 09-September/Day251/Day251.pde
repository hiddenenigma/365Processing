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
  size(500,500,OPENGL);
  physics = new VerletPhysics();
  physics.setDrag(0.0001);
  physics.addBehavior(new GravityBehavior(new Vec3D(0,0,0.5)));
  cam = new PeasyCam(this, 820);
  creators = new ArrayList<Creator>();
  for (int i = 0; i < 5; i++) {
    creator = new Creator(random(300,400), random(0.01,0.1));
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
  drawParticles();
  drawSpring();
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
    stroke(255,25);
    strokeWeight(1);
    line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
  }
}
