// Toxiclibs Library Example
// Line2D Intersect

class Line {
  float d;
  
  float x, x2;
  float y, y2;
  float move;
  
  Line(float x_, float x2_, float y_, float y2_, float move_, float d_) {
  x = x_;
  x2 = x2_;
  y = y_;
  y2 = y2_;
  move = move_;
  d=d_;
  }
  
  void display() {
    Line2D l=new Line2D(new Vec2D(0, y), new Vec2D(width,y2));
    Line2D m=new Line2D(new Vec2D(x,0), new Vec2D(x2,height));
    Line2D.LineIntersection isec=l.intersectLine(m);
    if (isec.getType()==Line2D.LineIntersection.Type.INTERSECTING) {
      Vec2D pos=isec.getPos();
      stroke(240);
      strokeWeight(0.5);
      fill(0);
      gfx.line(l);
      gfx.line(m);
      noStroke();
      ellipse(pos.x,pos.y,d,d);
      pos.x+= random(-1,1);
      pos.y+= random(-1,1);

    }
 
    y+= move;
    y2+= move;
    x+= move;
    x2+= move;
    
  }
}
