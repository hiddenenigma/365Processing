ArrayList<Flower> flowers;
float r;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  flowers = new ArrayList<Flower>();
  for (int i = 0; i < 1; i ++) {
    flowers.add(new Flower(0, 0, random(2, 50), random(255)));
    
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  r = noise(frameCount * 0.02) * 255;
  color c = color(r);
  fill(random(255));
  for (Flower f: flowers) {
    f.display();
    f.update();
  }
}
