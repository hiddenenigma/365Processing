/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 5;
FlowField flowfield;

Vehicle [] vehicles1 = new Vehicle[2000];
Vehicle [] vehicles2 = new Vehicle[2000];


void setup() {
  size(500, 500);
  background(0);

  flowfield = new FlowField(1);

  for (int i = 0; i < vehicles1.length; i ++ ) {
    vehicles1[i] = new Vehicle(new PVector(0, random(height)), random(0.4), random(0.1, 0.5), random(2));
  }  
  
  for (int i = 0; i < vehicles2.length; i ++ ) {
    vehicles2[i] = new Vehicle(new PVector(width, random(height)), random(0.4), random(0.1, 0.5), random(2));
  }  
}

void draw() {
//  saveFrame("output/frames####.png");

  flowfield.update();
  
  for (int i = 0; i < vehicles1.length; i ++ ) {
   vehicles1[i].follow(flowfield);
   vehicles1[i].run();
  }  
  for (int i = 0; i < vehicles2.length; i ++ ) {
   vehicles2[i].follow(flowfield);
   vehicles2[i].run();
  } 
}


