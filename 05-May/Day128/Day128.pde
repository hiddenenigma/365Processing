/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;
FlowField flow;

void setup() {
  size(500,500);
  smooth();
  flow = new FlowField(10);

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0 ; i < 3000; i ++) {
        vehicles.add(new Vehicle(random(width),random(height)));
  }
}

void draw() {
//  saveFrame("output/frames######.png");
  background(0);
  flow.init();

  for (Vehicle v: vehicles) {
    v.run();
    v.follow(flow);
    v.applyBehaviors(vehicles);
  }
}



