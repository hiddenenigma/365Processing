/* Source Cited:

Noise Wave by Daniel Shiffman
https://processing.org/examples/noisewave.html

*/

Wave [] waves = new Wave[400];

void setup() {
  size(500, 500);
  smooth();
  for (int i = 0; i < waves.length; i ++ ) {
    waves[i] = new Wave(random(0.1, 2), 0, random(-100, 500), random(100), random(6, 8));
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");
  background(255);
  translate(0, 140);
  for (int i = 0; i < waves.length; i ++ ) {
    waves[i].display();
  }
}

class Wave {
  float yoff, xoff;
  float size, size2; 
  float alpha;
  float dist;
  float weight;

  Wave(float w, float s, float s2, float a, float d) {
    yoff = 0;
    size = s;
    size2 = s2;
    alpha = a;
    dist = d;
    weight = w;
  }

  void display() {
    beginShape(); 
    xoff = 0;
    stroke(0);
    strokeWeight(weight);
    noFill();


    for (float x = -10; x <= width+10; x += dist) {
      float y = map(noise(xoff, yoff), 0, 1, size, size2); 
      vertex(x, y); 
      xoff += 0.02;
    }
    yoff += 0.01;
    vertex(width, height);
    vertex(-10, height);

    endShape(CLOSE);
  }
}
