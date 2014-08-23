ArrayList<Square> squares;

void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(30);
  squares = new ArrayList<Square>();
  for (int i = 0; i < width; i+= 5) {
    squares.add(new Square(random(255), random(0.1,7)));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  for (Square s: squares) {
    s.run();
  }
}
