/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 50;

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500);
  background(255);

  flowfield = new FlowField(5);
  vehicles = new ArrayList<Vehicle>();
  for (int i = -50; i < width+50; i+= d) {
    for (int j = -50; j < height+50; j += d) {
    vehicles.add(new Vehicle(new PVector(i,j), random(0.1), random(0.1, 0.5), random(255)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.separate(vehicles);
    v.update();
  }
}
