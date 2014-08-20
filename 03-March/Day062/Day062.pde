/* Source Cited:

Noise Wave by Daniel Shiffman
https://processing.org/examples/noisewave.html

*/

Wave [] waves = new Wave[20];

void setup() {
  size(500, 500);
  smooth();
  for (int i = 0; i < waves.length; i ++ ) {
  waves[i] = new Wave(0, random(400,500), random(50), 1);
  }  
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(255);
  for (int i = 0; i < waves.length; i ++ ) {
    waves[i].display();
  }
}

class Wave {
  float yoff, xoff;
  float size, size2; 
  float alpha;
  float dist;
  
  Wave(float s, float s2, float a, float d) {
    yoff = 0;
    size = s;
    size2 = s2;
    alpha = a;
    dist = d;

  }
  
  void display() {
    beginShape(); 
    xoff = 0;
    noStroke();
    fill(alpha, 50);

    translate(0, 5);
    for (float x = -10; x <= width+10 ; x += dist) {
      float y = map(noise(xoff, yoff), 0, 1, size, size2); 
      vertex(x,y); 
      xoff += 0.01;
  }
    yoff += 0.005;
    vertex(width, height);
    vertex(-10, height);

    endShape(CLOSE);
  }
}
