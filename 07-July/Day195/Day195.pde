/* Souce Cited:

  Recursion
  https://processing.org/examples/recursion.html

*/

float theta=0; 
int a = 7;
float b = 0;

void setup() {
  size(500,500);
  smooth();
  noStroke();
  background(255); 
}

void draw() {
//  saveFrame("output/frames####.png");
  pushMatrix();
  b = b + 0.02;
  float s = cos(b);
  translate(width/2, height/2);
  scale(s);
  rotate(theta);
  drawCircle(0,0,1000, a);
  theta+= 0.01;
  popMatrix();
}


void drawCircle(float x, float y, float r, int l) {
  PVector loc = new PVector(x,y);
  PVector vel = new PVector(random(-1,1), random(-1,1));
  PVector acc = new PVector(random(-0.01,0.01),random(-0.01,0.01));
  float tt = 200 * l/7;
  noStroke();
  fill(tt);
  ellipse(loc.x, loc.y, r*2, r*2);
  fill(255);
  ellipse(loc.x,loc.y,3,3);
  stroke(255,80);
  strokeWeight(l/3);
  float angle = 0;
  float aVel = 0;
  float aAcc = -0.03;
  line(loc.x-r,loc.y,loc.x+r,loc.y);
  line(loc.x,loc.y-r,loc.x,loc.y+r);

  if (l > 1) {
    l = l - 1;
    drawCircle(x - r/2, y, r/2, l);     
    drawCircle(x + r/2, y, r/2, l);
    drawCircle(x, y + r/2, r/2, l);
    drawCircle(x, y - r/2, r/2, l);
    drawCircle(x, y, r/2, l);

  }
}
