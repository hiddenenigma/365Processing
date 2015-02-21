/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

FlowField flowfield;

ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  background(0);

  flowfield = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  
  for (int i = 0; i < 150; i++) {
    vehicles.add(new Vehicle(new PVector(width/2, height/2), random(0.5, 2), random(0.1, 0.5), random(255), random(4)));
  }
}

void draw() {
//  saveFrame("output/frames####.tif");

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.separate(vehicles);
    v.run();
  }
}

