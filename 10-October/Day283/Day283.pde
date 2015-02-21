ArrayList<SquareGrid> squaregrid;
ArrayList<SquareGrid> squaregrid2;

void setup() {
  size(500, 500);
  smooth(8);
  rectMode(CENTER);
  noFill();
  stroke(0);
  squaregrid = new ArrayList<SquareGrid>();
  for (int i = 0; i < width+100; i+=100) {
    for (int j = 0; j < height+100; j+=100) {
      squaregrid.add(new SquareGrid(new PVector(i, j)));
    }
  }
  squaregrid2 = new ArrayList<SquareGrid>();
  for (int i = 50; i < 500; i+=100) {
    for (int j = 50; j < 500; j+=100) {
      squaregrid2.add(new SquareGrid(new PVector(i, j)));
    }
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
    exit();
  }
  background(0);
  for (SquareGrid sg : squaregrid2) {
    sg.display();
  }
  for (SquareGrid sg : squaregrid) {
    sg.display();
  }
}

