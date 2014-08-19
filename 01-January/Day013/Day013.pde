/* Source Cited:

 Nature of Code by Daniel Shiffman
 Introduction
 http://natureofcode.com
 
 */

// An array to keep track of how often random numbers are picked
int[] randomCounts;
int[] randomCounts2;


void setup() {
  size(500, 500);
  smooth();

  randomCounts = new int[100];
  randomCounts2 = new int[100];
}

void draw() {
  //    saveFrame("output/frames#################.tif");

  background(0);

  fill(255);
  strokeWeight(4);
  stroke(255);
  // Pick a random number and increase the count.
  int index = int(random(randomCounts.length));
  int index2 = int(random(randomCounts2.length));

  randomCounts[index]+= 20;
  randomCounts2[index2]+= 20;

  int w = width/randomCounts.length;
  int w2 = width/randomCounts2.length;

  for (int x = 0; x < randomCounts.length; x++) {
    ellipse((x*w)+3, -10+randomCounts[x], w-1, randomCounts[x]);
    ellipse((x*w)+3, 508-randomCounts[x], w-1, randomCounts[x]);
  }
}
