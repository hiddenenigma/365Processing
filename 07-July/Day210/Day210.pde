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
  for (int i = 0; i < 360; i+= 20) {
    trees.add(new Tree(width/2, height/2, radians(i)));
  }  
}

void draw() {
//  saveFrame("output/frame#####.png");

  background(0);  
  for (Tree t : trees) {
    t.display();
  }
}

