/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
 */

float a = 100;
float b = 7;
ArrayList<Pattern> patterns;

void setup() {
  size(500, 500);
  background(255);  
  frameRate(40);
  smooth();
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < width; i+= width) {
    patterns.add(new Pattern());
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  translate(497, height/2); 
  for (int i = -200; i < width+200; i+= 150) {
    for (int j = -200; j < height+200; j+= 150) {   
      for (Pattern p : patterns) {
        pushMatrix();
        rotate(radians(135));
        p.display(i, j, random(a), random(b));
        popMatrix();
      }
    }
  }
}

