/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 15;

// Flowfield object
FlowField flowfield;

// An ArrayList of vehicles
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  background(0);

  flowfield = new FlowField(8);
  vehicles = new ArrayList<Vehicle>();
  
  for (int i = 0; i < 300; i++) {
    vehicles.add(new Vehicle(new PVector(width/2, height/2), random(0.5, 1), random(0.1, 0.5), random(255), random(10)));
  }
}

void draw() {
//  saveFrame("output/frames#####.tif");

  flowfield.update();
  flowfield.display();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.separate(vehicles);
    v.run();
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(random(-50, width+50), random(-50, height+50)), random(0.5, 1), random(0.1, 0.5), random(255), random(0.1, 3)));
}


