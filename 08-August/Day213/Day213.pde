/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

ArrayList<Tree> trees;

void setup() {
  size(500, 500);  

  trees = new ArrayList<Tree>();
  for (int i = -100; i < width+100; i += 100) {
    for (int j = -100; j < height+100; j += 100) {
      trees.add(new Tree(i, j, radians(-90)));
    }
  }
}

void draw() {
//  saveFrame("output/frame#####.png");
  background(0);
  for (Tree t : trees) {
    t.display();
  }
}

