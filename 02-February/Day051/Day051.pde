/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 3: Oscillation

Adam Tindale
Creating Masks in Processing.org
http://www.adamtindale.com/blog/processing/129/
*/


Walker [] walkers = new Walker[2000];
PGraphics g;
int x;


void setup() {
  size(500, 500);
  background(0);

  for(int i = 0; i < walkers.length; i++) {
  walkers[i] = new Walker(width/2, height/2, random(-5,5), random(-30,30), random(2), random(.1,2), 255, random(255));
  }  
}

void draw() {
//  saveFrame("output/frames#################.tif");
  noStroke();
  fill(0, 15);
  rect(0,0, width, height);
  g = createGraphics(width,height);
  g.beginDraw();
  g.background(0);
  g.ellipse(width/2, height/2, 375, 375);
  g.filter(BLUR, 10);
  g.endDraw();
  for(int i = 0; i < walkers.length; i++) {
  walkers[i].display(); 
  walkers[i].update(); 
  walkers[i].step(); 
  walkers[i].checkEdges();
  }
  blend(g,0,0, width,height, 0,0,width,height,MULTIPLY);

}  
  
class Walker {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float loc;
  float loc2;
  float weight;
  float colour;
  float alpha;
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = random(-0.0001,0.0001);
  
  Walker(float x, float y, float l, float l2, float m, float w, float c, float a) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.3,0.3), random(-0.3,0.3));
    acceleration = new PVector(random(-0.1,0.1), random(-0.1,0.1));
    loc = l;
    mass = m;
    weight = w;
    colour = c;
    alpha = a;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity,-0.01,0.01);
    angle += aVelocity;
    acceleration.mult(0);
  }

  void display() {
    stroke(colour, alpha);
    strokeWeight(weight);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    line(loc, loc2, mass, mass);
    popMatrix();
  }

  void step() {
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    //[end]
    location.x += stepx;
    location.y += stepy;
  }
  
    void checkEdges() {

    // When it reaches one edge, set location to the other.
    if (location.x > width-50) {
      location = new PVector(width/2, height/2);
    } else if (location.x < 50) {
      location = new PVector(width/2, height/2);
    }

    if (location.y > height-50) {
      location = new PVector(width/2, height/2);
    } else if (location.y < 50) {
      location = new PVector(width/2, height/2);
    }

  }
}
