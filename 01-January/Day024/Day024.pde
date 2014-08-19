/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 2: Forces
 */

Snow[] snows = new Snow[1000];

void setup() {
  size(500, 500);

  for (int i = 0; i < snows.length; i++) {
    // Initialize each object in the array.
    snows[i] = new Snow(random(2, 10));
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");
  background(0);
  for (int i = 0; i < snows.length; i++) {

    float m = snows[i].mass;
    PVector wind = new PVector(random(0.1), 0);
    PVector gravity = new PVector(0, 0.01*m);
    snows[i].applyForce(gravity);
    snows[i].applyForce(wind); 
    snows[i].update();   
    snows[i].checkEdges();
    snows[i].display();
    snows[i].step();
  }
}



class Snow {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;
  float d = random(.01, 1);


  Snow(float m) {
    mass = m;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, d*mass, d*mass);
    if (mousePressed == true) {
      d -= .005;
    } else {
      d+= .005;
    }
  }

  void step() {
    int choice = int(random(4));
    if (choice == 0) {
      location.x++;
    } else if (choice == 1) {
      location.x--;
    } else if (choice == 2) {
      location.y++;
    } else {
      location.y--;
    }
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
