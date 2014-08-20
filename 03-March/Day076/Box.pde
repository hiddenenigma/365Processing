// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Box {
  
  Body body;
  float x, y;
  float w, h;
  float d;
  float f;
  
  Box(float x_, float y_, float w_, float h_, float f_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    f = f_;
    
    // Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    // Step 2: Create Body
    body = box2d.createBody(bd);
    
    //Step 3: Create Shape
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);
    
    // Step 4: Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = 1;
    
    // Step 5: Attach Shape to Body with Fixture
    body.createFixture(fd);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos.x, pos.y);
    fill(f);
    noStroke();
    rectMode(CENTER);
    ellipse(0, 0, w, w);
    popMatrix();
  }
}
