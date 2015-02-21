class SquareGrid {

  ArrayList<Square> squares;
  PVector origin;

  SquareGrid(PVector location) {
    origin = location.get();
    squares = new ArrayList<Square>();
    for (int i = 0; i < 50; i+= 1) {
      squares.add(new Square(origin, i, i));
    }
  }
  
  void display() {
    for (Square s : squares) {
      s.display();
      s.update();
    }
  }
}

