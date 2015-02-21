// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class GOL {
  
  int COLS, ROWS;
  int [][] board;
  int w = 10;
  PVector loc;
  PVector vel;
  float theta=0;
  float rotateTheta;
  
  Cell cell;
  
  GOL(float x, float y, float rotateTheta_) {
    rotateTheta = rotateTheta_; 
    COLS = width/w;
    ROWS = height/w;
    board = new int [COLS][ROWS];
    init();
    cell = new Cell(w);
    loc = new PVector(x,y);
    vel = new PVector(random(-1,1),random(-1,1));
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
  
  void display() {
    loc.add(vel);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    for (int i = 1; i < COLS-40; i++) {
      for (int j = 1; j < ROWS-40; j++) {
        if ((board[i][j] == 1)) fill(0);
        else                    fill(255);
        if ((board[i][j] == 1)) stroke(0);
        else                    stroke(255);
        strokeWeight(1);
        strokeCap(SQUARE);
        cell.display(i, j);
      }
    }
    theta+= rotateTheta;
    popMatrix();
  }
}
