/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 4: Particle Systems
http://natureofcode.com/

Generative Typography by Amon Owed
https://github.com/AmnonOwed/CAN_GenerativeTypography

*/

int maxParticles = 500; 
ArrayList <Particle> particles; 
color PGRAPHICS_COLOR = color(0);
PGraphics pg;
float r = 75;

void setup() {
  size(500, 500, P2D); 
  smooth(8); 
  particles = new ArrayList <Particle>(); 
  PGRAPHICS_FONT();  
  for (int i = 0; i < width+25; i += 25) {
    for (int j = 0; j < height+25; j += 25) {
      for (int k = 0; k < maxParticles; k++) {
        particles.add(new Particle(i, j, random(0,50)));
      }
    }
  } 
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(255);
  addRemoveParticles();
   for (Particle p : particles) {
    p.update();
    p.display();
    p.seek();
  }
}



