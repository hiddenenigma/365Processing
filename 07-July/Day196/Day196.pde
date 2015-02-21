/* Souce Cited:

  Recursion
  https://processing.org/examples/recursion.html
  
*/

int a = 7;
float b = 0;
float theta = 0;

ArrayList<Pattern> patterns;

void setup() {
  size(500,500);
  background(255);   
  smooth();
  patterns = new ArrayList<Pattern>();
  for (int i = 0; i < width; i+= 100) {
    patterns.add(new Pattern());
  }
}

void draw() {
//  saveFrame("output/frames####.png");
  
  translate(width/2, height/2);  
  for (int i = -200; i < width+200; i+= 100) {
    for (int j = -200; j < height+200; j+= 100) {  
      for (Pattern p: patterns) {
        pushMatrix();
        b = b + 0.02;
        float s = cos(b);
        scale(s);
        p.display(i,j,250,(int)random(a));
        theta+= 0.0001;
        popMatrix();        
      }
    }
  }
}

