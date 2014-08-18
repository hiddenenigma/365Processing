void setup() {
  size(500, 500);
  smooth(); 
  background(255);
  frameRate(30);
}

void draw() {
//  saveFrame("output3/frames#################.tif");
  fill(255, 20);
  noStroke();
  rect(0, 0, width, height);

  PVector mouse  = new PVector(random(mouseX), random(mouseY));
  PVector mouse2  = new PVector(random(mouseX -50), random(mouseY-50));
  PVector mouse3  = new PVector(random(mouseX-120), random(mouseY-120));
  PVector center = new PVector(width/2,height/2);

  mouse.sub(center);
  translate(width/2,height/2);
  noFill();
  float r = random(3);
  stroke(0);
  strokeWeight(4);
  ellipse(0,0, mouse.x, mouse.y);
  stroke(0);
  strokeWeight(1);
  ellipse(0, 0, mouse2.x, mouse2.y);
  strokeWeight(3);
  ellipse(0, 0, mouse3.x, mouse3.y);
}
