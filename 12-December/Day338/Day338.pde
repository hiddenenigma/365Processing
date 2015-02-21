import toxi.geom.*;
import processing.opengl.*;
import peasy.*;

PeasyCam cam;

ArrayList<Particle> particles;
float s = 0.3;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  cam = new PeasyCam(this, 3500);
  smooth(8);
  noFill();
  noStroke();
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 2500; i += 25) {
    Vec2D polar = new Vec2D(i, radians(i));
    Vec2D circ = polar.copy().toCartesian();
    particles.add(new Particle(i, radians(i), circ.x, circ.y));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  pushMatrix();
  rotate(t);
  scale(s);
  for(Particle p: particles) {
    p.run();
  }
  popMatrix();
  t+= 0.01;
}

