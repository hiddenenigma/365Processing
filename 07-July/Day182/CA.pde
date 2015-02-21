// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class CA {
  int[] cells; 
  int[] ruleset; 
  int w = 2; 
  int generation = 0; 

  float theta = 0;
  
  CA(int[] r) {
    ruleset = r;
    cells = new int[360];
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0; 
    }
    cells[cells.length/2] = 1; 
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
    int index = Integer.parseInt(s, 2); 
    return ruleset[index]; 
  }

  
  void display() {
    for (int i = 0; i < cells.length - 1; i++) {
      if (cells[i] == 1) fill(0);
      else               fill(255);
      noStroke();
      float radius = 5;
      float numPoints = 250;
      float angle = TWO_PI/numPoints; 
      float x = width/2 + sin(angle*i) * radius * generation;
      float y = height/2 + cos(angle*i) * radius * generation;
      ellipse(x, y, 5, 5);
    }
  }
  
  boolean finished() {
    if (generation > 200) { 
      return true;
    } else {
      return false;
    }
  }
}

