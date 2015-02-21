// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class CA {
  int[] cells;
  int[] ruleset;     
  int w = 5;
  int generation = 0;
  PVector loc, vel;
  int emit = 250;

  CA(int[] r, float x, float y) {
    loc = new PVector(x,y);
    vel = new PVector(1,1);
    ruleset = r;
    cells = new int[width/w];
    cells[cells.length/2] = 1; 
  }
  
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleset[i] = int(random(2));
    }
  }
  
  void update() {
    loc.add(vel);
  }
  
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    generation = 0;
  }    
    
  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation++;
  }  

  int rules (int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s,2);
    return ruleset[index];
  }
  
  void display() {
    for (int i = 0; i < cells.length; i++) {
      for(int j = 0; j < height; j+= 100) {

      if (cells[i] == 1) fill(255);
      else               fill(0);
      noStroke();
        for (int k = 1; k <= emit; k++) {
          float angle = k * TWO_PI / emit;
          float x = width/2 + cos(angle) * 250;
          float y = height/2 + sin(angle) * 250;    
          rect(i+j,y*generation,w,w);
        }
      }
    }
  }
  
  boolean finished() {
    if (generation > height/w) {
      return true;
    } else {
      return false;
    }
  }
}
