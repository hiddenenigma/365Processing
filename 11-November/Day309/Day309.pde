import toxi.geom.*;

float r;
float theta;

void setup() {
  size(500, 500, P3D);
  smooth(8);
  noFill();
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(theta);

  for (int i = -400; i < 400+10; i += 10) {
    for (int j = -400; j < 400+10; j += 10) {
      float len = noise(i * 1.5) * r; 
      Vec2D circ = new Vec2D(i, j); 
      stroke(0, 50); 
      strokeWeight(1); 
      ellipse(circ.x, circ.y, len, len);
    }
  }
  r += 0.5; 
  theta += 0.003; 
}

