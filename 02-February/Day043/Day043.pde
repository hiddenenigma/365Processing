/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 3: Oscillation
*/


Oscillator [] oscillators = new Oscillator[30];

void setup() {
  size(500, 500);
  frameRate(30);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(random(0.5,4), 0, random(-0.1,0.1));
  }
background(255);
}

void draw() {
    
//  saveFrame("output6/frames#################.tif");
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
  float theta;

  Oscillator(float m, float r, float t) {
    angle = new PVector();
    
    velocity = new PVector(random(-.05,.05), random(-.05,.05));
    //[offset-down] Random velocities and amplitudes
    amplitude = new PVector(random(width/2-50), random(height/2-50));
    mass = m;
    randomFill = r;
    theta = t;
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

    stroke(0,10);
    strokeWeight(1);
    fill(randomFill);
    translate(width/2, height/2);
    // Drawing the Oscillator as a line connecting a circle
    rotate(theta);
    noStroke();
    ellipse(x, y, mass, mass);
    theta += random(-0.06,0.06);
    popMatrix();
  }
}
