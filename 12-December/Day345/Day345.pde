import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;
import processing.opengl.*;
import java.util.Iterator;

VerletPhysics2D physics;
ArrayList<Creature> creatures;

Attractor a;
void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  stroke(0,5);
  physics=new VerletPhysics2D();
  physics.setDrag(0.1);
  creatures = new ArrayList<Creature>();
  for (int i = 0; i < 50; i++) {
    creatures.add(new Creature(random(width), random(height), (int)random(1,5)));
  }
}


void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  physics.update();
  
  for (Creature c : creatures) {
    c.display();
  }
}
