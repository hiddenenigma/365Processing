/* Source Cited:

Noise Wave by Daniel Shiffman
https://processing.org/examples/noisewave.html

Manipulating Circles by Jan Vantomme
http://vormplus.be/blog/article/processing-month-day-14-manipulating-circles

*/

DistortCircle [] dc = new DistortCircle[100];

void setup() {
  size(500, 500, P3D );
  smooth();
  for (int i = 0; i < dc.length; i++) {
    dc[i] = new DistortCircle(int(random(100, 400)), random(2, 60), random(0.1, 3), random(255));
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");

  background(255);
  translate(width/2, 165);
  for (int i = 0; i < dc.length; i++) {
    dc[i].display();
  }
}


