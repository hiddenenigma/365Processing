float x, y, x2, y2;
float angle = 0.02;

float a = 0.0;
float s = 0.0;

void setup() {
  size(500, 500);
  background(255);

  x = -40;
  y = -40;
  x2 = 40;
  y2 = 40;
}

void draw() {
//  saveFrame("output/frames#################.tif");

  a = a + 0.04;
  s = noise(a)*4;
  
  translate(width/2, height/2);
  scale(s); 

  rotate(angle);
  stroke(0, 50);
  strokeWeight(0.5);
  line(x, y, x2, y2);
  angle+= 0.02;
}

