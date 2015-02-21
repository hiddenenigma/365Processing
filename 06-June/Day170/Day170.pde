/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

import java.util.Iterator;

int d = 2;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  smooth();
  background(255);

  vehicles = new ArrayList<Vehicle>();

}

void draw() {
//  saveFrame("output/frames####.png");

  Iterator<Vehicle> it = vehicles.iterator();
  
  while (it.hasNext ()) {
    Vehicle v = it.next();
    v.applyBehaviors(vehicles);
    v.run();
    if (v.isDead()) {
      it.remove();
    }
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY), 2, 2, random(255), random(10)));
}

