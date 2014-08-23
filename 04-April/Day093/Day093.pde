ArrayList<Flower> flowers;

void setup() {
  size(500, 500);
  frameRate(24);
  smooth();
  noStroke();
  flowers = new ArrayList<Flower>();
  for (int i = 0; i < width+100; i += 25) {
    for (int j = 0; j < height+100; j+= 25) {
      flowers.add(new Flower(i, j, random(2, 50), random(255)));
    }
  }
}

void draw() {
//  saveFrame("output2/frames#################.png");
  background(255);
  for (Flower f: flowers) {
  f.display();
  }
}
