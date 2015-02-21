void PGRAPHICS_FONT() {
  PFont f = createFont("Helvetica", 100);
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(50);
  pg.fill(255);
  pg.textFont(f);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  for (int i = 100; i < width; i += 100) {
    for (int j = 100; j < height; j += 100) {
      pg.text(bio, i, j); 
    }
  }
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

