/* Source cited:
Vormplus: An Introduction to Processing Part II
http://vormplus.be/blog/article/an-introduction-to-processing-part-ii
*/

int circleSize = 0;
int shrinkOrGrow = 1;
float theta = 0.02;

void setup() {
    size(500, 500);
    ellipseMode(CENTER);
    frameRate(30);
    stroke(255);
    background(0);
    noFill();
    smooth();
}
void draw() {
//  saveFrame("output/frames#################.tif");

        // check the size of the circle
    if (circleSize > 200) {
        shrinkOrGrow = 0;
        println("circlesize: " + circleSize);
        println("shrinkOrGrow"  + shrinkOrGrow);
    } else if (circleSize < 20) {
        shrinkOrGrow = 1;
        println("circlesize: " + circleSize);
        println("shrinkOrGrow"  + shrinkOrGrow);
    }
    // check if the circle needs to grow or shrink
    if (shrinkOrGrow == 1) {
        circleSize += 1;
    } else if (shrinkOrGrow == 0) {
        circleSize -= 1;  
    }  
      
    background(0);
    for (int i = -500; i < 700; i += 15) {

    ellipse(width/2, height/2, circleSize+i, circleSize+i);
    }
    translate(width/2, height/2);
    for (int i2 = -100; i2 < 300; i2 += 5) {
    rotate(theta);
    ellipse(0, 0, circleSize+i2, circleSize+i2);
    theta++;
    }
}
