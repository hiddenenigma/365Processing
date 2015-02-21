class SquareGrid {

  ArrayList<Square> squares;
  PVector origin;
  float sd;

  SquareGrid(PVector location) {
    origin = location.get();
    squares = new ArrayList<Square>();
    for (int i = 0; i < 100; i+= 5) {
      squares.add(new Square(origin, i));
    }
  }

  void addSquare() {
  }

  void display() {
    for (Square s : squares) {
      s.display();
    }
  }
}

