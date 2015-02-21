void pgraphics_shape() {
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.fill(255);
  pg.fill(pgraphics_color);
  pg.ellipse(width/2, height/2, 350, 350); 
  pg.endDraw();  
}

void addRemoveParticles() {
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  } 
}

void mouseDragged() {
  particles.add(new Particle(mouseX,mouseY, random(255)));
}
