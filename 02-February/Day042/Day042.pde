/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 3: Oscillation
*/


Oscillator [] oscillators = new Oscillator[59];

void setup() {
  size(500, 500);
  frameRate(30);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(random(3, 10), random(255));
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");

  background(255);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i].oscillate();
    oscillators[i].display();
  }
}

class Oscillator {

  // Using a PVector to track two angles!
  PVector angle;
  PVector velocity;
  PVector amplitude;
  float mass;
  float randomFill;

  Oscillator(float m, float r) {
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    //[offset-down] Random velocities and amplitudes
    amplitude = new PVector(random(width/2-50), random(height/2-50));
    mass = m;
    randomFill = r;
  }

  void oscillate() {
    angle.add(velocity);
  }

  void display() {
    // Oscillating on the x-axis
    float x = sin(angle.x)*amplitude.x;
    // Oscillating on the y-axis
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2, height/2);
    stroke(0, 50);
    strokeWeight(0.5);
    fill(randomFill);
    // Drawing the Oscillator as a line connecting a circle
    line(0, 0, x, y);
    noStroke();
    ellipse(x, y, mass, mass);
    popMatrix();
  }
}
