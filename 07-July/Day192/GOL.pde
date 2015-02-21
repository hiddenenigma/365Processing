// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class GOL {
  
  int COLS, ROWS;
  int [][] board;
  int w = 5;
  PVector loc;
  PVector vel;
  float r, sw;
  
  Cell cell;
  
  GOL(float x, float y, float sw_) {
    COLS = width/w;
    ROWS = height/w;
    board = new int [COLS][ROWS];
    init();
    r = 10;
    sw = sw_;
    cell = new Cell(r);
    loc = new PVector(x,y);
    vel = new PVector(random(-0.7,0.7),0);
  }
  
  void init() {
    for (int x = 1; x < COLS-1; x++) {
      for (int y = 1; y < ROWS-1; y++) {
        board[x][y] = int(random(2));
      }
    }
  }
  
  void generate() {
    int[][] next = new int[COLS][ROWS];
    for (int x = 1; x < COLS-1; x++) {
      for (int y = 1; y < ROWS-1; y++) {
        int neighbours = 0;
        
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbours += board[(x+i+COLS)%COLS][(y+j+ROWS)%ROWS];
          }
        }
        
        neighbours -= board[x][y]; 

        if      ((board[x][y] == 1) && (neighbours <  2)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbours >  4)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbours == 3)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    
    board = next;
  }
  
  void display(ArrayList<GOL> gol) {
    loc.add(vel);

    pushMatrix();
    translate(loc.x, loc.y);
  
    for (int i = 1; i < COLS-60; i++) {
      for (int j = 1; j < ROWS-60; j++) {
        if ((board[i][j] == 1)) fill(255);
        else                    fill(0);
        if ((board[i][j] == 1)) stroke(255);
        else                    stroke(0);
        strokeWeight(sw);
        rect(i*w, j, 0, j);
      }
    }
    popMatrix();
  }
}
