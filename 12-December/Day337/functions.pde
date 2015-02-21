void pgraphics_shape() {
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.fill(255);
  pg.noFill();
  pg.stroke(pgraphics_color);
  pg.strokeWeight(2);
  for (int i = 0; i < 375; i += 20) {
    pg.ellipse(width/2, height/2, i, i);
  }
  pg.endDraw();
}

void addRemoveParticles() {
  for (int i=particles.size ()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
}

