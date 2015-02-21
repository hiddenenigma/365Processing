import toxi.geom.mesh2d.*;
import toxi.geom.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
Voronoi voronoi;
float speed = 1;
Vec2D p0;
Vec2D p1;
Vec2D p2;
Vec2D p3;
Vec2D p4;
Vec2D p5;
Vec2D p6;
Vec2D p7;
Vec2D p8;
Vec2D p9;

ArrayList<Vec2D> points;
float DSIZE = 10000;

boolean doIgnoreRoot=true;

void setup() {
  size(500, 500);
  smooth(5);
  voronoi = new Voronoi();
  gfx = new ToxiclibsSupport(this);
  p0 = new Vec2D(width/2, height/2);
  p1 = new Vec2D(width/2, height/2);
  p2 = new Vec2D(width/2, height/2); 
  p3 = new Vec2D(0,0);
  p4 = new Vec2D(width,0);
  p5 = new Vec2D(width/2, height);   
  p6 = new Vec2D(width/2, height/2);
  p7 = new Vec2D(width/2, height/2);     
  p8 = new Vec2D(width/2, 0);     
  p9 = new Vec2D(width/2, height/2);     
 
  points = new ArrayList<Vec2D>();
  for (int i = 0; i < 100; i++) {
    points.add(new Vec2D(random(-100,width+100), random(-100,height+100)));
  }
}

void draw() {
  //  saveFrame("output/frame####.png");
  background(255);
  drawVoronoi();
  update();
}


void update() {
  p0.addSelf(random(speed),random(speed));
  p1.addSelf(random(-speed),random(speed));
  p2.addSelf(random(-1,1),random(-speed));
  p3.addSelf(random(speed),random(speed));
  p4.addSelf(random(-speed),random(speed));
  p5.addSelf(0,random(-speed));
  p6.addSelf(random(speed),random(-1,1));
  p7.addSelf(random(-speed),random(-1,1));  
  p8.addSelf(random(-1,1),random(speed));
  p9.addSelf(random(-1,1),random(speed));
}

void drawVoronoi() {
  voronoi.addPoint(p0);
  voronoi.addPoint(p1);
  voronoi.addPoint(p2);
  for (Triangle2D t : voronoi.getTriangles ()) {
    stroke(0);
    if (!doIgnoreRoot || (abs(t.a.x)!=DSIZE && abs(t.a.y)!=DSIZE)) {
      gfx.triangle(t);
    }
  }  
}
