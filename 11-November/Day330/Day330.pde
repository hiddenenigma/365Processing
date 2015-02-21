import toxi.geom.*;
import processing.opengl.*;

ArrayList<Particle> particles;
float s = 0.5;
float t = 0;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  noFill();
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 360; i += 1) {
    Vec2D polar = new Vec2D(random(250), radians(i));
    Vec2D circ = polar.copy().toCartesian();
    particles.add(new Particle(i/55, i, circ.x, circ.y));
  }
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  pushMatrix();
  translate(width/2, height/2);
  scale(s);
  for(Particle p: particles) {
    p.display();
  }
  popMatrix();
  s+= 0.0005;
  t+= 0.002;
}

