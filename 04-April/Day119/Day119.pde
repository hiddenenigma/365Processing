/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

ArrayList<Vehicle> vehicles;
float theta = 0;

void setup() {
  size(500,500,P3D);
  smooth();

  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < width; i += 10) {
    for(int j = 0; j < height; j+= 10) {
    vehicles.add(new Vehicle(i,j,150));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(255);

  PVector target = new PVector(mouseX,mouseY);

  for (Vehicle v: vehicles) {
    v.run();
    v.seek(target);
    if (mousePressed) {
    v.flee(target);
    }
  }
  ellipse(target.x,target.y,0,0);
}
