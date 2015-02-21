import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;
import processing.opengl.*;

VerletPhysics2D physics;
ArrayList<Chain> chains;
ArrayList<Particle> particles;
Attractor a;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.08)));
  chains = new ArrayList<Chain>();
  for (int i = 0; i < 600; i++) {
    chains.add(new Chain(random(100,width-100), 1));
  }
  a = new Attractor(new Vec2D(width/2, height/2));
  a.lock();
}


void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  physics.update();
  for (Chain c : chains) {
    c.display();
  }
}

