float a = 0.0;
float s = 0.0;
float theta = 0.0;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  frameRate(30);
  smooth();
  background(0);
}

void draw() {
//  saveFrame("output/frames#################.tif");
  a = a + 0.04;
  s = cos(a)*3;
  translate(width/2, height/2);
  scale(s); 
  rotate(theta);
  noStroke();
  fill(255);
  stroke(0);
  rect(0, 0, 100, 100); 
  theta += 0.02;  
}
