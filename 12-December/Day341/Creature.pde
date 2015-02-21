class Creature {

  PVector loc, vel;
  float circRadius, creatureRadius;  
  ArrayList<Circle> circles;  

  Creature(float x, float y, float circRadius_, float creatureRadius_) {
    loc = new PVector(x, y);
    vel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    circRadius = circRadius_;
    creatureRadius = creatureRadius_;
    circles = new ArrayList<Circle>();
    for (int i = 0; i < creatureRadius; i+= 5) {
      float angle = TWO_PI/creatureRadius * i;
      float circX = sin(angle) * creatureRadius;
      float circY = cos(angle) * creatureRadius;
      circles.add(new Circle(circX+loc.x, circY+loc.y, circRadius, 1, random(0.005, 0.04)));
    }
  }

  void run() {
    display();
    loc.add(vel);
  }

  void display() {
    stroke(255, 25);  
    strokeWeight(0.5);
    for (Circle c : circles) {
      c.display();
    }
  }
}

