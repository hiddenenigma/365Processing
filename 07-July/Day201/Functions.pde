void pattern(float x, float y, float len) {
  if (len >= 1) {
    float w = len/50;
    float c = 100*len/55;
    strokeWeight(1);
    stroke(0);
    noFill();
    ellipse(x,y,len/4,len/4);
    pattern(x-len/3,y,len/3);
    pattern(x+len/3, y, len/3);
    pattern(x, y-len/3,len/3);
    pattern(x,y+len/3,len/3);
  }
}

void pattern2(float x, float y, float len) {
  if (len >= 1) {
    float w = len/50;
    float c = 100*len/55;
    strokeWeight(1);
    stroke(0);
    noFill();
    ellipse(x,y,len/2,len/2);
    ellipse(x+len/2,y,len/2,len/2);
    ellipse(x-len/2,y,len/2,len/2);
    ellipse(x,y+len/2,len/2,len/2);    
    ellipse(x,y-len/2,len/2,len/2);
    pattern2(x-len/4,y,len/4);
    pattern2(x+len/4, y, len/4);
    pattern2(x, y-len/4,len/4);
    pattern2(x,y+len/4,len/4);
  }
}

