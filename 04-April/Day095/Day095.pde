ArrayList<Flower> flowers;

void setup() {
  size(500, 500);
  background(255);
  frameRate(30);
  smooth();
  noStroke();
  flowers = new ArrayList<Flower>();
  for (int i = 0; i < 10; i ++) {
    flowers.add(new Flower(width/2, height/2, random(5,40), random(70,100)));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  for (Flower f: flowers) {
    f.display();
    f.checkEdges();
  }
}
