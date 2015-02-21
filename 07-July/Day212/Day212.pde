/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

ArrayList<Tree> trees;

void setup() {
  size(500, 500);
  frameRate(5);
  trees = new ArrayList<Tree>();
  for (int i = 0; i < width+15; i += 15) {
    for (int j = 0; j < height+15; j += 15) {
    trees.add(new Tree(i,j, radians(random(360))));
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

