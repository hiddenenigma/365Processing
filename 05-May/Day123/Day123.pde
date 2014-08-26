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
  for (int i = -4 ; i < width+10; i += 2) {
    for (int j = -10; j < height+10; j += 5) {
        vehicles.add(new Vehicle(i,j, random(255),  cos(radians(j)) * 20));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  background(255);
  for (Vehicle v: vehicles) {
    v.run();
    v.separate(vehicles);
  }
}



