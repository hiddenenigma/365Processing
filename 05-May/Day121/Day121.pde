/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;
float theta = 0;

void setup() {
  size(500,500);
  smooth();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < width+10; i += 4) {
    for(int j = 0; j < height+10; j+= 4) {
    vehicles.add(new Vehicle(i,j));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);

  PVector target = new PVector(width/2, height/2);

  for (Vehicle v: vehicles) {
    v.run();
    v.separate(vehicles);
    if (mousePressed) {
    v.flee(target);
    }
  }
}
