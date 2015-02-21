/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

int d = 20;

FlowField flowfield;


void setup() {
  size(500, 500);
  background(255);

  flowfield = new FlowField(3);

}

void draw() {
//  saveFrame("output/frames####.png");
  fill(255,255);
  noStroke();
  rect(0, 0, width, height);

  flowfield.update();
  flowfield.display();

}



