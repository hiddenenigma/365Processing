ArrayList<SquareGrid> squaregrid;
float ang = radians(45);

void setup() {
  size(500, 500);
  smooth(8);
  noFill();
  rectMode(CENTER);
  squaregrid = new ArrayList<SquareGrid>();
  for (int i = -500; i < width+500; i+=125) {
    for (int j = -500; j < height+500; j+=125) {
      squaregrid.add(new SquareGrid(new PVector(i, j)));
    }
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount == 600) {
    exit();
  }
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  scale(2);
  rotate(ang);
  for (SquareGrid sg : squaregrid) {
    sg.display();
  }
  popMatrix();
  ang+=0.01;
}

