/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 10;

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500);

  flowfield = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  for (int i = -20; i < width+40; i+= d) {
    for (int j = -20; j < height+40; j += d) {
    vehicles.add(new Vehicle(new PVector(i,j), random(0.5, 2), random(0.1, 0.5)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.separate(vehicles);
    v.update();
  }
}

