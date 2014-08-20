/* Source Cited:
 
 Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com
 
*/


//import libraries
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;

void setup() {
  size(500, 500);
  background(255);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
}

void draw() {
//  saveFrame("output/frames#################.png");

  box2d.step();
  
  if (mousePressed) {
    for (int x = -10; x < width+10; x +=10) {
    Box p = new Box(x, 0, random(255));
    boxes.add(p);
    }
  }
  for (Box b: boxes) {
    b.display();
  }
}
