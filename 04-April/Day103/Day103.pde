ArrayList<Mover> movers;

void setup() {
  size(500,500);
  background(255);
  smooth();
  frameRate(30);
  movers = new ArrayList<Mover>();
  for (int i = 0; i < width; i+= 5) {
    movers.add(new Mover(random(255), random(0.1,7)));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  for (Mover m: movers) {
    m.run();
  }
}
