// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class GOL {
  
  int COLS, ROWS;
  int [][] board;
  int w = 20;
  float theta = 0;
  int r = 4;
    
  GOL() { 
    COLS = width/w;
    ROWS = height;
    board = new int [COLS][ROWS];
    init();
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
        else if ((board[x][y] == 1) && (neighbours >  3)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbours == 2)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    
    board = next;
  }
  
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    for (int i = 1; i < COLS-23; i++) {
      for (int j = 1; j < ROWS; j++) {
        if ((board[i][j] == 1)) fill(0);
        else                    fill(255);
        noStroke();
        rectMode(CENTER);
        rect(i, j*5, 10, 10);
      }
    }
    theta+= 0.03;
    popMatrix();
  }
}
