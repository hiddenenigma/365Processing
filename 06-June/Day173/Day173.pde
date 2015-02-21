/* Souce Cited:

The Nature of Code by Daniel Shiffman
Chapter 6: Autonomous Agents
http://natureofcode.com/

*/

Flock flock;

void setup() {
  size(500,500);

  flock = new Flock();
  for (int i = 0; i < width+2; i++) {
    for(int j = 0; j < height+50; j+= 50) {
      Boid b = new Boid(i, j,random(0.05,1));
      flock.addBoid(b);
    }
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  background(255);  
  flock.run();
}

