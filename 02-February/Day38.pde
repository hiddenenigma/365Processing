/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 3: Oscillation
 */


float angle = 0;
float aVelocity = 0;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  noFill();
}

void draw() {
  //  saveFrame("output/frames#################.tif");

  background(0);

  for (int y = 0; y < height-150; y += 20) {
    for (int x = 0; x < width-150; x += 20) {      
      pushMatrix();
      translate(width/2, height/2);
      rotate(angle);
      strokeWeight(1);
      stroke(255, 40);
      ellipse(0, mouseY, width-150, y);
      ellipse(mouseX, 0, x, height-150);
      aVelocity += 0.01;
      angle += aVelocity;
      aVelocity = constrain(aVelocity, -0.01, 0.-1);
      popMatrix();
    }
  }
}
