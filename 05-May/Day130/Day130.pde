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
  background(0);
  flow = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < width + 5; i += 10) {
    for (int j = 0; j < height + 5; j += 10) {
        vehicles.add(new Vehicle(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
  flow.init();
  
  for (Vehicle v: vehicles) {
    v.run();
    v.applyBehaviors(vehicles);
    v.follow(flow);
  }
}



