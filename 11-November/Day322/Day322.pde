import toxi.geom.*;

float r = 0;
float theta2 = radians(45);

void setup() {
  size(500,500,P3D);
  noFill();
  stroke(0,45);
}

void draw() {
//  saveFrame("output/frame####.png");

  background(255);
  translate(width/2, height/2);
  rotate(theta2);
  Vec2D normUp = new Vec2D(0, -1);
  for(int i = 0; i < 360*3; i += 1) {
    float theta = radians(i);
    Vec2D polar = new Vec2D(200,theta);
    float len = noise(polar.y + r) * i;
    Vec2D circ = polar.copy().toCartesian();
    beginShape(LINES);
    vertex(circ.x, circ.y);
    vertex(circ.y, circ.x);
    endShape();
  }
  
  r+=0.01;
  theta2 += 0.01;
}

