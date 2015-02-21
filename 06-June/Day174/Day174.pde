/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

import java.util.Iterator;

Flock flock;

void setup() {
  size(500,500);
  background(0);
  flock = new Flock();
  for (int i = 0; i < width; i+= 25) {
    for(int j = 0; j < height; j+= 25) {
      Boid b = new Boid(i, j,random(0.01));
    }
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
  
  flock.run();
}

void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY,random(2)));
}
