ArrayList <Circle> circles = new ArrayList <Circle> ();
color pgraphics_color = color(0);
PGraphics pg;

void setup() {  
  size(500, 500, P2D);
  background(255);
  smooth(8);
  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.fill(pgraphics_color);
  pg.ellipse(width/2, height/2,350,350);
  pg.endDraw();
}

void draw() {
//  saveFrame("output/frame####.png");
  addCircles(35); 
  for (Circle c : circles) {
    c.update();
    c.display();
  }
}

void addCircles(int num) {
  for (int i=0; i<num; i++) {
    int x = int(random(width));
    int y = int(random(height));
    if (pg.get(x, y) == pgraphics_color) {
      boolean overlap = false;
      for (Circle c : circles) {
        if (dist(x, y, c.x, c.y) <= c.radius + 2) {
          overlap = true;
          break;
        }
      }
      if (!overlap) {
        circles.add(new Circle(x, y));
      }
    }
  }
}

