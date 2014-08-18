/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors

Adam Tindale
Creating Masks in Processing.org
http://www.adamtindale.com/blog/processing/129/
*/

Line [] lines = new Line[600];
PGraphics g;

void setup() {
  size(500, 500);
  noFill();
  smooth();
  noStroke();
  frameRate(30);
  for (int i = 0; i < lines.length; i ++) {
    lines[i] = new Line(random(width), random(height), random(width), random(height),random(width), random(height), random(0.01,0.1), random(255), random(5));
  }
}

void draw() {
//  saveFrame("output2/frames#################.tif");
  background(0);
  g = createGraphics(width,height);
  g.beginDraw();
  g.background(0);
  g.ellipse(width/2, height/2, 375, 375);
  g.filter(BLUR, 10);
  g.endDraw();
  for (int i = 0; i < lines.length; i ++) {
    lines[i].update();
    lines[i].display();
    lines[i].checkEdges();
    lines[i].renderCircle();
  }
  blend(g,0,0, width,height, 0,0,width,height,MULTIPLY);


}

class Line {
  PVector location;
  PVector location1;
  PVector location2;
  PVector velocity;
  PVector velocity1;
  PVector velocity2;
  float theta = 0.02;
  float weight;
  float alpha;
  float r;
  float mass;

  
  Line(float x, float y, float x1, float y1, float x2, float y2, float w, float a, float m) {
    location = new PVector(x, y);
    location1 = new PVector(x1, y1);
    location2 = new PVector(x2, y2);
    velocity = new PVector(random(-1,1), random(-1,1));
    velocity1 = new PVector(random(-1,1), random(-1,1));
    velocity2 = new PVector(random(-1,1), random(-1,1));
    weight = w;
    alpha = a;
    mass = m;
  }
  
  void update() {
    location.add(velocity);
    location1.add(velocity1);
    location2.add(velocity2);
  }
  
    void renderCircle() {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, mass, mass);
    ellipse(location1.x, location1.y, mass, mass);
    ellipse(location2.x, location2.y, mass, mass);
  }
  
  void display() {
    beginShape();
    stroke(255, alpha);
    strokeWeight(weight);
    noFill();
    vertex(location.x, location.y);
    vertex(location1.x, location1.y);
    vertex(location2.x, location2.y);
    endShape(CLOSE);
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
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
    
        if (location1.x > width) {
      location1.x = width;
      velocity1.x *= -1;
    } else if (location1.x < 0) {
      velocity1.x *= -1;
      location1.x = 0;
    }

    if (location1.y > height) {
      velocity1.y *= -1;
      location1.y = height;
    } else if (location1.y < 0) {
      velocity1.y *= -1;
      location1.y = 0;
    }
          if (location2.x > width) {
      location2.x = width;
      velocity2.x *= -1;
    } else if (location2.x < 0) {
      velocity2.x *= -1;
      location2.x = 0;
    }

    if (location2.y > height) {
      velocity2.y *= -1;
      location2.y = height;
    } else if (location2.y < 0) {
      velocity2.y *= -1;
      location2.y = 0;
    }
  }
}
