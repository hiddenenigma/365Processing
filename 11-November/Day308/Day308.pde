import toxi.geom.*;

float r = 0;
float theta2 = 0;

void setup() {
  size(500, 500, P3D);
  smooth(8);
  noFill();
    stroke(0, 85);
    strokeWeight(1);  
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(theta2);

  Vec2D normUp = new Vec2D(0, -1);
  for (int i = 0; i < 360*6; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(i/6, theta);
    float len = noise(polar.y * theta2) * r;
    Vec2D circ = polar.copy().toCartesian();
    ellipse(circ.x, circ.y, len, len);
  }
  r -= 0.1;
  theta2 += 0.001;
}

