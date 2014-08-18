// Example of what not to do.

float angle1 = 0.0;
float offset1 = 250;
float scalar1 = 30;
float speed1 = 0.02;

float angle2 = 0.0;
float offset2 = 250;
float scalar2 = 40;
float speed2 = 0.03;

float angle3 = 0.0;
float offset3 = 250;
float scalar3 = 60;
float speed3 = 0.04;

float angle4 = 0.0;
float offset4 = 250;
float scalar4 = 80;
float speed4 = 0.042;

float angle5 = 0.0;
float offset5 = 250;
float scalar5 = 100;
float speed5 = 0.05;

void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
//  saveFrame("output/frames#################.tif");

  float x1 = offset1 + cos(angle1) * scalar1;
  float y1 = offset1 + sin(angle1) * scalar1;
  fill(random(0,255));
  noStroke();
  ellipse(x1, y1, 10, 10);
  angle1 += speed1;
  float x2 = offset2 + cos(angle2) * scalar2;
  float y2 = offset2 + sin(angle2) * scalar2;
  ellipse(x2, y2, 20, 20);
  angle2 += speed2;
  float x3 = offset3 + cos(angle3) * scalar3;
  float y3 = offset3 + sin(angle3) * scalar3;
  ellipse(x3, y3, 40, 40);
  angle3 += speed3;
  float x4 = offset4 + cos(angle4) * scalar4;
  float y4 = offset4 + sin(angle4) * scalar4;
  ellipse(x4, y4, 10, 10);
  angle4 += speed4;
  float x5 = offset5 + cos(angle5) * scalar5;
  float y5 = offset5 + sin(angle5) * scalar5;
  ellipse(x5, y5, 20, 20);
  angle5 += speed5;
  fill(random(200,255));
  ellipse(250, 250, 50, 50);
}
