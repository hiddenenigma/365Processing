import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D physics;

ArrayList<Ball> balls;
Ball ball;
int numBalls = 15;
Attractor attractor;

void setup() {
  size(500, 500);

  physics=new VerletPhysics2D();
  physics.setDrag(0.09);
  physics.setWorldBounds(new Rect(-50, -50, width+100, height+100));

  balls = new ArrayList<Ball>();

  attractor = new Attractor(new Vec2D(width/2, height/2));
  attractor.lock();
}

void draw() {
//  saveFrame("output/frame####.tif");
  background(0);
  
  physics.update();
  if (balls.size() < numBalls) {
    ball = new Ball((int)random(40, 150), (int)random(1, 175), new Vec2D(width/2, height/2));
    balls.add(ball);
  }
  ball.display();
}

