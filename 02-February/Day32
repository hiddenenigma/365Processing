/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 2: Forces
 */

// A Mover and an Attractor
Mover[] movers = new Mover[1000];
Attractor a;

void setup() {
  size(500, 500);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height), random(.1, 2));
  }
  a = new Attractor();
  background(0);
}

void draw() {
//   saveFrame("output/frames#################.tif");

   for (int i = 0; i < movers.length; i++) {
     PVector force = a.attract(movers[i]);
     movers[i].applyForce(force);
     movers[i].update();
     a.display();
     movers[i].display();
  }

}

class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
    G = 0.9;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();

    distance = constrain(distance,5.0,25.0);


    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
    noStroke();
    fill(255, 0);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
}


class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;

  Mover(float x, float y, float m) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
//    stroke(0);
    if (mousePressed == true) {
      fill(0);
    } else {
      fill(255);
    }
    ellipse(location.x,location.y,mass,mass);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}


