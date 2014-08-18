void setup() {
  size(500, 500);
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(255);
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);

  float m = mouse.mag();
  
  fill(0);
  for (int i = 0; i < height; i += 10) {
  rect(0,i,m*2,4);
  }
   for (int i2 = 7; i2 < height; i2 += 10) {
  rect(width,i2,-m*2,4);
  }

  translate(width/2,height/2);
  for (int y = -250; y < 255; y+=5) {
  line(0,y,mouse.x,mouse.y);
  }
  for (int y2 = -250; y2 < 255; y2+=5) {
  line(0,y2,-mouse.x,mouse.y);
  }
}
