/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 2: L-Systems
 http://www.plethora-project.com/
 
 Video tutorial: http://vimeo.com/32701378
 
*/

import peasy.*;
PeasyCam cam;

ArrayList<Branch> branches;
PVector l;
PVector v;
float a1 = 300;
int emit = 600;

void setup() {
  size(500, 500, P3D);
  smooth(8);
  cam = new PeasyCam(this, 350);
  branches = new ArrayList<Branch>();
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  branches.clear();
  for (int i = -emit; i < emit+100; i+=40) {
    for (int j = -emit; j < emit+100; j+=100) {
      for (int k = -emit; k < emit+200; k+=200) {
        l = new PVector(i, j, k);
        v = new PVector(random(5), 0, 0);
        branches.add(new Branch(l, v, 8, "A"));
      }
    }
  }
  for (Branch b : branches) {
    b.display();
  }  
  a1++;
}

