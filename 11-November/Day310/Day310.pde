import toxi.geom.*;

float r = 0;

void setup() {
  size(500, 500, P3D);
  smooth(8);
  noFill();
  stroke(0, 50);
  strokeWeight(1);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(radians(90));

  for (int i = 0; i < 360*3; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(250, theta);
    float len = noise(polar.y * 3.5) * r;
    Vec2D circ = polar.copy().toCartesian();
    ellipse(circ.x, circ.y, 1, len);
  }
  
  r += 2;
}

