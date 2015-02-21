ArrayList<Circle> circles;

void setup() {
  size(500, 500);
  noFill();
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 375; i += 1) {
    circles.add(new Circle(i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  if (frameCount==600) {
    exit();
  }
  background(0);
  translate(width/2, height/2);
  for (Circle c : circles) {
    c.display();
  }
}

