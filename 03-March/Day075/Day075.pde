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

// A list for all of our rectangles
ArrayList<Box> boxes;
Box2DProcessing box2d;    

void setup() {
  size(500, 500);
  background(255);

  smooth();
  // Initialize and create the Box2D world
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  
  // Create ArrayLists
  boxes = new ArrayList<Box>();
}

void draw() {
//  saveFrame("output3/frames#################.png");
  box2d.step();    

  for (int x = 0; x < 1; x++) {
  if (mousePressed) {
    Box p0 = new Box(random(width), random(height), 13, 13, 0);
    Box p1 = new Box(mouseX, mouseY, width, 1, 255);
    Box p2 = new Box(mouseX, mouseY, width, 1, 0);

    boxes.add(p0);
    boxes.add(p1);
    boxes.add(p2);
    }
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}
