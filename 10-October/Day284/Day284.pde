ArrayList<SquareGrid> squaregrid;

void setup() {
  size(500, 500);
  smooth(8);
  rectMode(CENTER);
  noFill();
  strokeCap(SQUARE);

  squaregrid = new ArrayList<SquareGrid>();
  for (int i = -50; i < width+150; i+=50) {
    for (int j = -50; j < height+150; j+=50) {
      squaregrid.add(new SquareGrid(new PVector(i, j)));
    }
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
    exit();
  }
  background(0);
  for (SquareGrid sg : squaregrid) {
    sg.display();
  }
}

