/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;

void setup() {
  size(500,500,P3D);
  smooth();
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 2500; i ++) {
    vehicles.add(new Vehicle(random(width),random(height),100));
  }
  
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);
  PVector target = new PVector(width/2,height/2);
  for (Vehicle v: vehicles) {
    v.run();
    v.seek(target);
  }
  ellipse(target.x,target.y,0,0);
}
