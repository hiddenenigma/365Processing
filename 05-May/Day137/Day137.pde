/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 20;

ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500);
  background(255);

  vehicles = new ArrayList<Vehicle>();
  for (int i = -20; i < width+20; i+= d) {
    for (int j = -20; j < height+20; j += d) {
    vehicles.add(new Vehicle(new PVector(i,j), random(0.1), random(0.1, 0.5)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  for (Vehicle v : vehicles) {
    v.separate(vehicles);
    v.update();
  }
}


