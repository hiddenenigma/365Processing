/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

Generative Typography by Amon Owed
https://github.com/AmnonOwed/CAN_GenerativeTypography

*/

int maxParticles = 300; 
ArrayList <Particle> particles; 
color PGRAPHICS_COLOR = color(0);
PGraphics pg;
String bio = "+";

void setup() {
  size(500, 500, P2D); 
  smooth(8); 
  particles = new ArrayList <Particle>(); 
  PGRAPHICS_FONT(); 
  for (int i = 0; i < maxParticles; i++) {
    particles.add(new Particle(width/2, height/2, random(255)));
  }
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(255);
  translate(0, -12);
  addRemoveParticles();
  for (Particle p : particles) {
    p.update();
    p.display(particles);
    p.seek();
  }
}



