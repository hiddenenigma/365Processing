/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

ArrayList<System> systems;

void setup() {
  size(500,500);
  systems = new ArrayList<System>();
  for(int j = 0; j < 360; j += 10) {
    systems.add(new System(width/2, height/2, radians(j)));
  }
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(0);
  for (System s : systems) {
    s.display();
  }
}

