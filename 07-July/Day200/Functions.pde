void pattern(float x, float y, float len) {
  if (len >= 1) {
    float w = len/75;
    strokeWeight(w);
    line(x,y+len,x+len,y);
    line(x,y-len,x-len,y);
    line(x+len,y,x,y-len);
    line(x-len,y,x,y+len);
    pattern(x,y,len/2);
  }
}

void pattern2(float x, float y, float len) {
  if (len >= 1) {
    float w = len/500;
    strokeWeight(1);
    line(x,y+len,x+len,y);
    line(x,y-len,x-len,y);
    pattern2(x,y,len/1.2);
  }
}

