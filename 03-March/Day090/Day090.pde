/* Source Cited:
 
 Jan Vantomme 
 Distorted Grids
 http://vormplus.be/blog/article/processing-month-day-28-distorted-grids
 
*/

Grid1 g1;
Grid2 g2;
Grid3 g3;

void setup() {
    size(500, 500);
    frameRate(30);
    smooth();
    g1 = new Grid1();
    g2 = new Grid2();
    g3 = new Grid3();
}

void draw() {
//  saveFrame("output/frames#################.png");
    background(0);
    g1.display();
    g2.display();
    g3.display();

}

