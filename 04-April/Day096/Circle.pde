class Circle {
  float theta = 0;
  float w,h,c;
  
  Circle(float w_, float h_, float c_) {
    w = w_;
    h = h_;
    c = c_;
  }
  
  void display() {
    strokeCap(SQUARE);
    stroke(c);
    smooth();
    noFill();
    pushMatrix();
    translate(w,h);
    rotate(theta);
    int circleResolution = (int) map(mouseY, 0,height,2,100);
    float radius = mouseX-width/2 + 0.5;
    float angle = TWO_PI/circleResolution;
    strokeWeight(mouseY/30);
    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = cos(angle*i) * radius;
      float y = sin(angle*i) * radius;
      line(0, 0, x, y);
    }
    endShape();
    theta += 0.003;
    popMatrix();
  }
}
