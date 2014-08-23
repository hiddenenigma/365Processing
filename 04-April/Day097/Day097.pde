ArrayList<Circle> circles;

void setup(){
  background(255);
  size(500, 500);
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 1; i += 1) {
    circles.add(new Circle(width/2,height/2,random(255)));
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  for (Circle c: circles) {
    c.display();
  }
}
