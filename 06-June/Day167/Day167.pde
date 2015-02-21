/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

FlowField flowfield;

void setup() {
  size(500, 500);
  background(255);

  flowfield = new FlowField(20);
}

void draw() {
//  saveFrame("output/frames####png");

  flowfield.update();
  flowfield.display();
}
