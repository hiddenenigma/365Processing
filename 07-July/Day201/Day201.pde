/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

float a = 0;

void setup() {
  size(500,500);
}

void draw() {
//  saveFrame("output/frames####.png");
  background(255);

  for (int i = 0; i < width+100; i += 100) {
    for (int j = 0; j < height+100; j += 100) {
      pattern2(i,j, a);
      a+=0.1;
    }
  }
}


