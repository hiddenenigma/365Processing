/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 10;
FlowField flowfield;

void setup() {
  size(500, 500);
  background(0);
  flowfield = new FlowField(5);
}

void draw() {
//  saveFrame("output/frames####.tif");
  fill(0,50);
  noStroke();
  rect(0, 0, width, height);
  flowfield.update();
  flowfield.display();
}


