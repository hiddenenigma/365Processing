/* Souce Cited:

  The Nature of Code by Daniel Shiffman
  Chapter 8: Fracals
  http://natureofcode.com/

*/

int a = 7;
float theta = 0;

ArrayList<Pattern> patterns;

void setup() {
  size(500,500);
  smooth();
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < width; i+= 100) {
    patterns.add(new Pattern());
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  background(255);   

//  translate(width/2, height/2);  
  for (int i = -200; i < width+200; i+= 100) {
    for (int j = -200; j < height+200; j+= 100) {  
      for (Pattern p: patterns) {
        pushMatrix();
        p.display(random(i),random(j),random(75));
        theta+= 0.0001;
        popMatrix();        
      }
    }
  }
}

