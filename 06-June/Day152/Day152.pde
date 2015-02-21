/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  background(255);

  flowfield = new FlowField(1);
  
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < height; i++) {
    vehicles.add(new Vehicle(new PVector(0,i), random(0.1, 0.5)));
  }
}

void draw() {
//  saveFrame("output/frames####.tif");

  flowfield.update();
  
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}




