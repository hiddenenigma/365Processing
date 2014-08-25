/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500);
  smooth();
  background(0);

  vehicles = new ArrayList<Vehicle>();
  for (int i = -5 ; i < width+5; i += 5) {
    for (int j = -5; j < height+5; j += 5) {
        vehicles.add(new Vehicle(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  for (Vehicle v: vehicles) {
    v.run();
    v.applyBehaviors(vehicles);
  }
}



