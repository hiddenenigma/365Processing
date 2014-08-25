/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500);
  smooth();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0 ; i < width; i += 5) {
    for (int j = 0; j < height; j += 2) {
        vehicles.add(new Vehicle(i,j, random(255),  cos(radians(j)) * 2));
    }
  }
}

void draw() {
//  saveFrame("output4/frames#################.png");

  background(0);
  for (Vehicle v: vehicles) {
    v.run();
    v.separate(vehicles);
  }
}


