import toxi.geom.*;
import processing.opengl.*;
import peasy.*;

PeasyCam cam;
ArrayList<Particle> particles;
float s = 0.3;

void setup() {
  size(500, 500, OPENGL);
  cam = new PeasyCam(this, 1200);
  smooth(8);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 2200; i += 25) {
    Vec2D polar = new Vec2D(i, radians(i));
    Vec2D circ = polar.copy().toCartesian();
    particles.add(new Particle(i, radians(i), circ.x, circ.y));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  pushMatrix();
  scale(s);
  for(Particle p: particles) {
    p.run();
  }
  popMatrix();
}

