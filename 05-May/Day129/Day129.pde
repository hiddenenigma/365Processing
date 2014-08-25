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
  for (int i = 0; i < width + 5; i += 5) {
    for (int j = 0; j < height + 5; j += 5) {
        vehicles.add(new Vehicle(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);

  flow.init();
  
  for (Vehicle v: vehicles) {
    v.run();
    v.applyBehaviors(vehicles);
    v.follow(flow);
  }
}



