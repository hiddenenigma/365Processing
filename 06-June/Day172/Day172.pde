/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

Flock flock;
void setup() {
  size(500,500);
  background(255);  

  flock = new Flock();

}

void draw() {
//  saveFrame("output/frames####.png");

  flock.run();
}

void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY,random(255)));
}
