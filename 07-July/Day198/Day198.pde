/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 8: Fracals
 http://natureofcode.com/
 
*/

int a = 7;
float l = 0;
ArrayList<Pattern> patterns;

void setup() {
  size(500, 500);
  smooth();
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < width; i+= width) {
    patterns.add(new Pattern());
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  background(255);   

  translate(width+100, height/2);  
  for (int i = -100; i < width+200; i+= 100) {
    for (int j = -100; j < height+200; j+= 100) {  
      for (Pattern p : patterns) {
        pushMatrix();
        rotate(radians(135));
        p.display(i, j, l);
        popMatrix();  
        l += 0.1;
      }
    }
  }
}

