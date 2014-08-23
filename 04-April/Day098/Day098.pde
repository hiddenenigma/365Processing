ArrayList<Circle> circles;

void setup(){
  background(255);
  size(500, 500);
  circles = new ArrayList<Circle>();
  for (int i = -20; i < width+150; i += 50) {
    for (int j = -40; j < height+150; j += 50) {
    circles.add(new Circle(i,j,random(255)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  for (Circle c: circles) {
    c.display();
  }
}
