import processing.opengl.*;

int maxParticles = 5000; // the maximum number of active particles
ArrayList <Particle> particles; // the list of particles


color pgraphics_color = color(0);
PGraphics pg;
float radius = 375;

void setup() {
  size(500, 500, OPENGL); 
  smooth(8); 
  particles = new ArrayList <Particle>(); 

  pgraphics_shape();  
  for (int i = 0; i < maxParticles; i++) {
    float angle = TWO_PI/radius * i;
    float x = cos(angle) * radius + width/2;
    float y = sin(angle) * radius + height/2;
    particles.add(new Particle(x, y, random(255)));
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
  println(frameCount);
}


