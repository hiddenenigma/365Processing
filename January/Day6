float x;
float y;
float px;
float py;
float easing = 0.05;

void setup() {
  frameRate(30);
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
//  saveFrame("output3/frames#################.tif");
  fill(255, 10);
  stroke(0);
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight*1.6);   
  ellipse(x, y, px, py); 
  ellipse(x+20, y+20, px-220, py-200);
  py = y;
  px = x;
}
