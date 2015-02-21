/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 6: Autonomous Agents
 http://natureofcode.com/
 
*/

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  size(500, 500);
  background(0);
  flowfield = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  for (int i = -10; i < width+10; i+= 10) {
    for (int j = -10; j < height+10; j += 5) {
      vehicles.add(new Vehicle(new PVector(i,0), random(0.1,0.5), 0.1, random(255), random(2)));
    }
  }
}

void draw() {
//  saveFrame("output/frames######.png");

  flowfield.update();
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}



