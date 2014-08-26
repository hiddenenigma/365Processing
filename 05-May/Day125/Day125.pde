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
  for (int i = -10 ; i < 200; i ++) {
        vehicles.add(new Vehicle(random(width), random(width), random(10,20)));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(0);
  PVector target = new PVector(width/2, height/2);
  for (Vehicle v: vehicles) {
    v.run();
    v.separate(vehicles);
    v.seek(target);
  }
}




