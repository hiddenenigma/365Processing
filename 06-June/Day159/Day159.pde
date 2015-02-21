/* Source Cited:

  Circles, Spirals and Sunflowers by Jim Bumgardner
  http://krazydad.com/tutorials/circles_js/

*/

ArrayList<Circle> circles;
float angle = 0;

void setup() {
  size(500, 500);
  smooth();
  frameRate(10);
  circles = new ArrayList<Circle>();
  for (int i = 0; i < 35; i++) {
    circles.add(new Circle(random(2, 400), random(255)));
  }
}

void draw() {
  // saveFrame("output/frames#####.png");
  background(255); 
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  for (Circle c : circles) {
    c.display();
  }
  angle+= 0.05;
  popMatrix();
}

