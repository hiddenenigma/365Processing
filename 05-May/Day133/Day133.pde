/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  flowfield = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
}

void draw() {
  //  saveFrame("output16/frames#################.tif");
  background(255);

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.update();
    v.follow(flowfield);
    v.separate(vehicles);
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY), random(0.5, 2), random(0.1, 0.5), random(255)));
}


