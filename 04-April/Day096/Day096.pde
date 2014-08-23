ArrayList<Circle> circles;

void setup(){
  background(255);
  size(500, 500);
  circles = new ArrayList<Circle>();
  for (int i = -26; i < width+300; i += 51) {
    for (int j = -26; j < height+150; j += 51) {
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
