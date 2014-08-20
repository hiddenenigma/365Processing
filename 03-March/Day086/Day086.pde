/* Source Cited:

Nature of Code by Daniel Shiffman
Chapter 1: Vectors

Amon P5
25 Life-Saving Tips for Processing
Tip # 1
http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/

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
