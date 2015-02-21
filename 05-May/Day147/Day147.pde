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
  for (int i = 0; i < 2000; i++) {
    vehicles.add(new Vehicle(new PVector(random(249,251), random(249,251)), random(0.5,1), random(0.1, 0.5), random(5)));
  }
}

void draw() {
//  saveFrame("output/frames####.png");

  flowfield.update();
  flowfield.display();
  
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.separate(vehicles);
    v.run();
  }
}




