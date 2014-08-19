/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 http://natureofcode.com
 
 */

Ball[] balls = new Ball[6000];

void setup() {
  size(500, 500);

  frameRate(30);
  smooth();
  background(0);
  for (int i = 0; i < balls.length; i++) {
    // Initialize each object in the array.
    balls[i] = new Ball();
  }
}

void draw() {
  // saveFrame("output/frames#################.tif");

  background(0);

  for (int i = 0; i < balls.length; i++) {
    //[full] Calling functions on all the objects in the array
    balls[i].update();
    balls[i].checkEdges();
    balls[i].display();
    //[end]
  }
}


class Ball {
  PVector location;
  PVector velocity;


  Ball() {
    location = new PVector(250, random(0, 50));
    velocity = new PVector(random(-1.25, 1.25), random(4, 5));
  }

  void update() {
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(random(255));
    ellipse(location.x, location.y, random(3), random(3));
  }

  void checkEdges() {
    if ((location.x > width) || (location.x < 0)) { 
      velocity.x = velocity.x * -1;
    } 
    if ((location.y > height) || (location.y < 0)) { 
      velocity.y = velocity.y * -1;
    }
  }
}




