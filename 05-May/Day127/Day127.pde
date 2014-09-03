/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;
FlowField flow;

void setup() {
  size(500,500);
  smooth();
  flow = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0 ; i < width+15; i +=15) {
    for (int j = 0; j < height+15; j +=15) {
        vehicles.add(new Vehicle(i, j));
    }
  }
}

void draw() {
//  saveFrame("output/frames####.tif");
  background(0);
  flow.init();
  PVector target = new PVector(width/2,height/2);
  for (Vehicle v: vehicles) {
    v.update();
    v.separate(vehicles);
    if (mousePressed) {
      v.flee(target);
    }
  }
}



