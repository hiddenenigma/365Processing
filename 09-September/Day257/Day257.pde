import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;

ArrayList<Triangle> triangles;
Triangle triangle;
int numBalls = 350;

void setup() {
  size(500, 500);

  physics=new VerletPhysics2D();
  physics.setDrag(0.3);
  physics.setWorldBounds(new Rect(-50, -50, width+100, height+100));

  triangles = new ArrayList<Triangle>();

}

void draw() {
//  saveFrame("output/frame####.png");
  background(0);
  physics.update();
  if (triangles.size() < numBalls) {
    triangle = new Triangle(3, (int)random(3, 6), new Vec2D(width/2, height/2));
    triangles.add(triangle);
  }
  triangle.display();
}

