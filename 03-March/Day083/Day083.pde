ArrayList <hLine> hlines;
ArrayList <vLine> vlines;

void setup() {
  size(500, 500);
  smooth();

  hlines = new ArrayList<hLine>();
  for (int i = 0; i < 30; i ++){
    hlines.add(new hLine(random(height), random(height), random(-1,1), random(-1,1), random(10,30)));
  }
  vlines = new ArrayList<vLine>();
   for (int i = 0; i < 300; i ++){
   vlines.add(new vLine(random(width), random(width), random(-1,1), random(-1,1), random(0.1,0.5), 0));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");
  background(255);

  for (hLine hl: hlines) {
    hl.run();
  }
  
  for (vLine vl: vlines) {
    vl.run();
  }
}
