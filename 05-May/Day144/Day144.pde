/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

FlowField flowfield;

void setup() {
  size(500, 500);
  background(0);
  flowfield = new FlowField(5);
}

void draw() {
//  saveFrame("output/frames#####.png");
  fill(0,70);
  noStroke();
  rect(0, 0, width, height);
  flowfield.update();
  flowfield.display();
}



