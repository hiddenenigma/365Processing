ArrayList <hLine> hlines;
ArrayList <vLine> vlines;

void setup() {
  size(500, 500);
  smooth();
  background(255);

  hlines = new ArrayList<hLine>();
  for (int i = 0; i < 20; i ++){
    hlines.add(new hLine(random(height), random(height), random(-0.5,0.5), random(-0.5,0.5), random(0.1,0.5), 255));
  }
  vlines = new ArrayList<vLine>();
   for (int i = 0; i < 20; i ++){
   vlines.add(new vLine(random(height), random(height), random(-0.5,0.5), random(-0.5,0.5), random(0.1,0.5), 0));
  }
}

void draw() {
//  saveFrame("output/frames#################.png");

  for (hLine hl: hlines) {
    hl.run();
  }
  for (vLine vl: vlines) {
    vl.run();
  }
}
