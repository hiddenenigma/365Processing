/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors
*/


Flower [] flowers = new Flower[100];

void setup() {
  size(500, 500, P3D);
  smooth();
  frameRate(30);
  for(int i = 0; i < flowers.length; i ++) {
  flowers[i] = new Flower(random(100, width-100), random(100, height-100));
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");

  background(255);
  for(int i = 0; i < flowers.length; i ++) {
  flowers[i].display();
  flowers[i].update();
  flowers[i].checkEdges();
  }
}

class Flower {
  
  PVector location;
  PVector velocity;
  float point1;
  float m = 150;
  float r = random(255);

  
  Flower(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(-1,1), random(-1, 1));
  }
  
  void update() {
    location.add(velocity);
  }
  
  void display() {
    m++;
    noFill();
    stroke(0);

    strokeWeight(1);
    
    if (mousePressed == true) {
      m -= 1;
    }
    
    bezier(location.x, location.y, m, m, width-m, m, location.x, location.y);
    bezier(location.x, location.y, m, height-m, width-m, height-m, location.x, location.y);
    bezier(location.x, location.y, m, m, m, height-m, location.x, location.y);
    bezier(location.x, location.y, width-m, m, width-m, height-m, location.x, location.y);
 
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


