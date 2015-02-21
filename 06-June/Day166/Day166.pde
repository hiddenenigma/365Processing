/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 1;

FlowField flowfield;

ArrayList<Vehicle> vehicles1;
ArrayList<Vehicle> vehicles2;
ArrayList<Vehicle> vehicles3;
ArrayList<Vehicle> vehicles4;

void setup() {
  size(500, 500);

  flowfield = new FlowField(10);
  
  vehicles1 = new ArrayList<Vehicle>();
  vehicles2 = new ArrayList<Vehicle>();
  vehicles3 = new ArrayList<Vehicle>();
  vehicles4 = new ArrayList<Vehicle>();

  for (int i = 0; i < width+5; i+= d) {
      vehicles1.add(new Vehicle(new PVector(i,0), random(0.6), 0.1, random(255), random(2)));
  }
  for (int i = 0; i < width+5; i+= d) {
      vehicles2.add(new Vehicle(new PVector(i,height), random(0.6), 0.1, random(255), random(2)));
  }
  for (int i = 0; i < width+5; i+= d) {
      vehicles3.add(new Vehicle(new PVector(0,i), random(0.6), 0.1, random(255), random(2)));
  }
  for (int i = 0; i < width+5; i+= d) {
      vehicles4.add(new Vehicle(new PVector(width,i), random(0.6), 0.1, random(255), random(2)));
  }  
}

void draw() {
//  saveFrame("output/frames####png");
  background(255);

  flowfield.update();
  PVector target = new PVector(width/2, height/2);
  
  for (Vehicle v : vehicles1) {
    v.follow(flowfield);
    v.seek(target);
    v.separate(vehicles1);
    v.run();
  }
  for (Vehicle v : vehicles2) {
    v.follow(flowfield);
    v.seek(target);
    v.separate(vehicles2);    
    v.run();
  }
  for (Vehicle v : vehicles3) {
    v.follow(flowfield);
    v.separate(vehicles3);
    v.seek(target);
    v.run();
  }
  for (Vehicle v : vehicles4) {
    v.follow(flowfield);
    v.separate(vehicles4);
    v.seek(target);
    v.run();
  }
}
