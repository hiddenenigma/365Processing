class SquareGrid {

  ArrayList<Square> squares;
  PVector origin;
  float angle = 0;

  SquareGrid(PVector location) {
    origin = location.get();
    squares = new ArrayList<Square>();
    for (int i = 0; i < 100; i+= 3) {
      squares.add(new Square(origin, i, i/2));
    }
  }
  
  void display() {
    pushMatrix();
    rotate(angle);
    for (Square s : squares) {
      s.display();
    }
    angle+=0.01;
    popMatrix();
  }
}

