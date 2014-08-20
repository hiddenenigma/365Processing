ArrayList<Square> squares;

void setup() {
  size(500,500);
  background(255);
  smooth();
  squares = new ArrayList<Square>();
  for(int i = 0; i < 50; i++) {
    squares.add(new Square(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height), random(255), random(0.1,0.5)));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  for (Square s: squares) {
    s.run();
  }
}
   
