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
  flow = new FlowField(5);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0 ; i < width; i +=1) {
    vehicles.add(new Vehicle(width/2, 0, random(190,255)));
  }
}

void draw() {
//  saveFrame("output/frames###########.png");
  background(0);

  for (Vehicle v: vehicles) {
    v.run();
    v.separate(vehicles);
    v.follow(flow);
  }
}



