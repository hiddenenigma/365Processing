/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 2;

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  background(0);

  flowfield = new FlowField(5);
  vehicles = new ArrayList<Vehicle>();
  for (int i = -10; i < width+10; i+= d) {
    for (int j = -10; j < height+10; j += 5) {
      vehicles.add(new Vehicle(new PVector(i,0), random(0.01,0.6), 0.1, random(255), random(2)));
    }
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  fill(0,0);
  noStroke();
  rect(0, 0, width, height);

  flowfield.update();

  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}



