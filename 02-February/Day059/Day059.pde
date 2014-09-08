Wave [] waves = new Wave[15];

void setup() {
  size(500, 500);
    background(255);

  for (int i = 0; i < waves.length; i ++ ) {
  waves[i] = new Wave(random(0.1,3), random(-100,500), random(height), random(-100,width), random(width+200), random(100), random(5));
  }  
}

void draw() {
//  saveFrame("output/frames####.tif");

  for (int i = 0; i < waves.length; i ++ ) {
    waves[i].display();
  }
}

class Wave {
  float yoff, xoff;
  float weight;
  float size, size2; 
  float mass, mass2;
  float alpha;
  float dist;
  
  Wave(float w, float s, float s2, float m, float m2, float a, float d) {
    yoff = 0;
    weight = w;
    size = s;
    size2 = s2;
    mass = m;
    mass2 = m2;
    alpha = a;
    dist = d;
  }
  
  void display() {
    beginShape(POINTS); 
    xoff = 0;
    stroke(0, alpha);
    strokeWeight(weight);

    for (float x = 0; x <= width ; x += dist) {
      float y = map(noise(xoff, yoff), 0, 1, size, size2); 
      vertex(x,y); 
      xoff += 0.02;
  }
    yoff += 0.01;
    endShape();
  }
}
