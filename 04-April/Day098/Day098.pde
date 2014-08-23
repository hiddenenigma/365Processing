ArrayList<Spike> spikes;

void setup(){
  background(255);
  size(500, 500);
  spikes = new ArrayList<Spike>();
  for (int i = -20; i < width+150; i += 50) {
    for (int j = -40; j < height+150; j += 50) {
    spikes.add(new Spike(i,j,random(255)));
    }
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  for (Spike s: spikes) {
    s.display();
  }
}
