class Circle {
  int nbr_circles; 
  float sm_d, lg_d;
  float lg_r;
  float lg_circ;
  float cx, cy;
  float c;

  
  Circle(float lg_d_, float c_) {
    nbr_circles =2; 
    lg_d = lg_d_;
    lg_r = lg_d/2;
    lg_circ = PI/50 * lg_d;
    sm_d = lg_circ / nbr_circles;
    cx = 0;
    cy = 0;
    c=c_;
  }

  void display() {
   noStroke();
   fill(c);
   for (int i = 1; i <= nbr_circles; i++) {
     float angle = i * TWO_PI / nbr_circles;
     float x = cx + cos(angle) * lg_r;
     float y = cy + sin(angle) * lg_r;
     ellipse(x,y,sm_d,sm_d);
    } 
     nbr_circles++;
  }
} 
