void PGRAPHICS_FONT() {
  PFont f = createFont("Helvetica", 100);
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.fill(255);
  pg.textFont(f);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.rectMode(CENTER);
  for (int i = 0; i < width+25; i += 25) {
    for (int j = 0; j < height+25; j += 25) {
      pg.ellipse(i, j, random(15), random(15)); 
    }
  }  
  pg.endDraw();  
}

void addRemoveParticles() {
  // remove particles with no life left
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  } 
// add particles until the maximum
//  while (particles.size () < maxParticles) {
//    particles.add(new Particle(mouseX,mouseY));
//  }
}

void optimize() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].clear();
    }
  }
  
  for (Particle p : particles) {
    int x = int(p.loc.x) / scl;
    int y = int(p.loc.y) / scl;
    for (int n = -1; n <= 1; n++) {
      for (int m = -1; m <= 1; m++ ) {
        if (x+n >= 0 && x+n < cols && y+m >= 0 && y+m < rows) grid[x+n][y+m].add(p);
      }
    }
  }
}

void mouseDragged() {
  particles.add(new Particle(mouseX,mouseY, random(255)));
}
