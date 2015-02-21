/* Source Cited:

  Processing Tutorial: Spherical Coordinates
  Jer Thorp
  http://blog.blprnt.com/blog/blprnt/processing-tutorial-spherical-coordinates

*/

import processing.opengl.*;
import peasy.*;

PeasyCam cam;
ArrayList<SphereItem> sphereItems;
int numItems = 3000;
float theta;

void setup() {
  size(500, 500, OPENGL);
  cam = new PeasyCam(this, 250);
  sphereItems = new ArrayList<SphereItem>();
  for (int i = 0; i < numItems; i++) {
    sphereItems.add(new SphereItem(100,random(TWO_PI),random(TWO_PI)));
  }
}

void draw() {
//  saveFrame("output/frame####.tif");

  background(255);
  rotateY(theta);
  rotateX(theta);
  for (SphereItem si : sphereItems) {
    si.update();
    si.render();
    si.connect(sphereItems);
  }
  theta+= 0.01;
}
