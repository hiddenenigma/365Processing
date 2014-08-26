/* Source Cited:

The Nature of Code by Daniel Shiffman
Chapter 1: Vectors
http://natureofcode.com/

*/

ArrayList<Square> squares;
ArrayList<SquareSmall> squareSmall;

void setup() {
  size(500,500);
  frameRate(30);
  noFill();
  rectMode(CENTER);
  squares = new ArrayList<Square>();
  for (int i = 0; i < width+25; i += 25) {
    for (int j = 0; j < height+25; j += 25) {
      squares.add(new Square(i,j, random(0.1,3)));
    }
  }
  squareSmall = new ArrayList<SquareSmall>();
  for (int i = 0; i < width+10; i += 10) {
    for (int j = 0; j < height+10; j += 10) {
      squareSmall.add(new SquareSmall(i,j, random(0.1,1)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  background(255);
  for (Square s: squares) {
    s.display();
  }
    for (SquareSmall sm: squareSmall) {
    sm.display();
  }
}
