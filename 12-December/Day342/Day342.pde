import processing.opengl.*;

ArrayList<System> systems;
float rad = 200;

void setup() {
  size(500, 500, OPENGL);
  smooth(8);
  background(0);
  systems = new ArrayList<System>();   
}

void draw() {
//  saveFrame("output/frame####.tif");
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);  
  pushMatrix();
  translate(width/2, height/2);  
  for (System s : systems) {
    s.display();
  }
  popMatrix();
}

void mouseDragged() {
  systems.add(new System(mouseX-300, mouseY-250, random(5, 25)));
}

