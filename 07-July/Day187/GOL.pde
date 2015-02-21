// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class GOL {
  
  int COLS, ROWS;
  int [][] board;
  int w = 5;
  PVector loc;
  PVector vel;
  
  Cell cell;
  
  GOL(float x, float y) { 
    COLS = 50/w;
    ROWS = 50/w;
    board = new int [COLS][ROWS];
    init();
    cell = new Cell(w);
    loc = new PVector(x,y);
    vel = new PVector(floor(random(-2,2)), floor(random(-2,2)));
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
        else if ((board[x][y] == 0) && (neighbours == 1)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    
    board = next;
  }
  
  void display() {
    loc.add(vel);
    for (int i = 1; i < COLS-1; i++) {
      for (int j = 1; j < ROWS-1; j++) {
        if ((board[i][j] == 1)) fill(0);
        else                    fill(255);
        noStroke();
        cell.display(loc.x+i*w, loc.y+j*w);      
      }
    }
  }
}
