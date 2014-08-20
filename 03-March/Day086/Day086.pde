/* Source cited:

Nature of Code by Daniel Shiffman
Chapter 1: Vectors

*/

ArrayList <Square> squares;

void setup() {
  size(500,500);
  smooth();
  background(255);
  squares = new ArrayList<Square>();
  for (int i = 0; i < height; i += 5) {
    squares.add(new Square(random(width), i));
  }

}

void draw() {
//  saveFrame("output/frames#################.png");
  for (Square s: squares) {
    s.run();
  } 
}
