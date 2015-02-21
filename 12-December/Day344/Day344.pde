import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;
import processing.opengl.*;
import java.util.Iterator;

VerletPhysics2D physics;

Attractor a;
void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0, 25);
  physics=new VerletPhysics2D();
  physics.setDrag(0.1);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  for (int i=0; i<1000; i++) {
    ParticleString2D s=new ParticleString2D(physics, new Vec2D(width/2, height/2), Vec2D.fromTheta(i*TWO_PI*0.001).scaleSelf(8), 30, 1, 0.05);
  }
  a = new Attractor(new Vec2D(width/2, height/2));
  a.lock();
}


void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  physics.update();
  
  for (Iterator i=physics.springs.iterator (); i.hasNext(); ) {
    VerletSpring2D s=(VerletSpring2D)i.next();
    line(s.a.x, s.a.y, s.b.x, s.b.y);
  }
  
  for (Iterator i=physics.particles.iterator (); i.hasNext(); ) {
    VerletParticle2D g=(VerletParticle2D)i.next();
    fill(0);
    ellipse(g.x, g.y, 3, 3);
    g.x += random(-1, 1);
    g.y += random(-1, 1);
  }
}

