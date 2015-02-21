class GradientShape {

  int loc;
  float angle;

  GradientShape(float angle_) {
    angle = angle_;
  }

  void run() {
    display();
    update();
  }

  void display() {
    pushMatrix();
    rotate(radians(angle));
    ColorGradient grad=new ColorGradient();
    grad.addColorAt(loc, TColor.BLACK);
    grad.addColorAt(width, TColor.WHITE);
    ColorList l=grad.calcGradient(0, width);
    int x = 500;
    for (Iterator i=l.iterator (); i.hasNext(); ) {
      TColor c=(TColor)i.next();
      stroke(c.toARGB());
      line(0, loc, x, height);
      x++;
    }
    popMatrix();
  }

  void update() {
    float m = millis();
    loc = (int)((((250+sin(m/700)*250))/2 ));
  }
}

