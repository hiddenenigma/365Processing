ArrayList<Square> squares;

void setup() {
  size(500,500);
  smooth();
  squares = new ArrayList<Square>();
  for (int i = 0; i < width+10; i+= 10) {
    for (int j = 0; j < height+10; j+= 10) {
      squares.add(new Square(i,j, random(255)));
    }
  }
}

void draw() {
//  saveFrame("output2/frames#################.tif");
  background(255);

  for (Square s: squares) {
    s.display();
  }
}
