import processing.opengl.*;

int maxParticles = 600; 
ArrayList <Particle> particles; 
color pgraphics_color = color(0);
PGraphics pg;
float radius = 360;

void setup() {
  size(500, 500, OPENGL); 
  smooth(8); 
  particles = new ArrayList <Particle>(); 
  pgraphics_shape();
  for (int i = 0; i < maxParticles; i++) {
    particles.add(new Particle(width/2, height/2, random(255)));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  addRemoveParticles();
  for (Particle p : particles) {
    p.update();
    p.display(particles);
    p.seek();
  }
}



