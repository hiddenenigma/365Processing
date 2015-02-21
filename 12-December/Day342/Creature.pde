class Creature {

  PVector loc;
  float circRadius, creatureRadius;  
  ArrayList<Circle> circles;  
  float p;

  Creature(float x, float y, float circRadius_, float creatureRadius_, float p_) {
    loc = new PVector(x, y);
    circRadius = circRadius_;
    creatureRadius = creatureRadius_;
    p = p_;
    circles = new ArrayList<Circle>();
    for (int i = 0; i < creatureRadius; i+= 1) {
      float angle = TWO_PI/creatureRadius * i;
      float circX = sin(angle) * creatureRadius;
      float circY = cos(angle) * creatureRadius;
      circles.add(new Circle(circX+loc.x, circY+loc.y, circRadius, p));
    }
  }

  void run() {
    display();
  }

  void display() {
    stroke(255,15);  
    strokeWeight(1);
    for (Circle c : circles) {
      c.display();
    }
  }
}

