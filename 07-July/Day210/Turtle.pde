class Turtle {
  String todo;
  float len;
  float theta;
  float rad;
  
  Turtle(String s, float l, float t, float r) {
    todo = s;
    len = l;
    theta = t;
    rad = r;
  }
  
  void render() {
    stroke(255,0);
    fill(255,rad);
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F') {
        line(0,0,len,0);
        translate(len,0);
        ellipse(0,0,5,5);
      } else if (c == 'G') {
        line(0,0,len,0);
      } else if (c == '-') {
        rotate(-theta);
      } else if (c == '+') {
        rotate(theta);
      } else  if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      }
    }
  }
  
  void setLen(float l) {
    len = l;
  }
  
  void setRadius(float r) {
    rad = r;
  }
  
  void changeRad(float percent) {
    rad *= percent;
  }
  
  void changeLen(float percent) {
    len *= percent;
  }
  
  void setToDo(String s) {
    todo = s;
  }
  
}
