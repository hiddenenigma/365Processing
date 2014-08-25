/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/


ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500);
  smooth();
  vehicles = new ArrayList<Vehicle>();
  for (int i = -25; i < width+25; i+= 25) {
    for (int j = -2; j < height+2; j+= 2) {
        vehicles.add(new Vehicle(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);

  for (Vehicle v: vehicles) {
    v.run();
    v.applyBehaviors(vehicles);
  }
}



