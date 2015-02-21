ArrayList<Square> squares;

void setup() {
  size(500, 500);
  noFill();
  rectMode(CENTER);
  squares = new ArrayList<Square>();
  for (int i = 0; i < 1500; i ++) {
    squares.add(new Square(i));
  }  
}

void draw() {
//  saveFrame("output/frame####.png");

  background(0);
  translate(width/2, height/2);
  for (Square s : squares) {
    s.display();
  }
}

