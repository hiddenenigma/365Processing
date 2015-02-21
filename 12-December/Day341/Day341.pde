import processing.opengl.*;

ArrayList<Creature> creatures;
float rad=400;

void setup() {
  size(500,500,OPENGL);
  smooth(8);
  noFill();
  strokeWeight(1);
  creatures = new ArrayList<Creature>();
  
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  for (Creature c : creatures) {
    c.run();
  }
}

void mouseDragged() {
    creatures.add(new Creature(mouseX, mouseY, random(40, 50), random(10, 50)));
}


