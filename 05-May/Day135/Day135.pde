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
  background(255);

  flowfield = new FlowField(5);
  vehicles = new ArrayList<Vehicle>();
  for (int i = -20; i < width+20; i+= d) {
    for (int j = -20; j < height+20; j += d) {
    vehicles.add(new Vehicle(new PVector(width/2, height/2), random(0.5, 1), random(0.1, 0.5), random(255)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}




