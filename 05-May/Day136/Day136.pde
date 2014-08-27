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
  background(0);
  flowfield = new FlowField(5);
  vehicles = new ArrayList<Vehicle>();
  for (int i = -20; i < width+20; i+= d) {
    for (int j = -20; j < height+20; j += d) {
    vehicles.add(new Vehicle(new PVector(random(248,252), random(248,252)), random(0.5, 1), random(0.1, 0.5)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  fill(0,20);
  noStroke();
  rect(0,0,width,height);

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.separate(vehicles);
    v.run();
  }
}




