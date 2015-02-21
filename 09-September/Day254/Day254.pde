/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

VerletPhysics2D physics;
ArrayList<Ball> balls;
Attractor attractor;

int numBalls = 150;

void setup() {
  size(500,500);
  initPhysics();
  balls = new ArrayList<Ball>();
}

void draw() {
//  saveFrame("output7/frame#####.png");
  background(0);
  physics.update();
  for (Ball b : balls) {
    b.display();
  }

  if (balls.size() < numBalls) {
    balls.add(new Ball((int)random(10,20), new Vec2D(random(width),random(height))));
  }
}

void initPhysics() {
  physics = new VerletPhysics2D();
  physics.setDrag(1.2);
  physics.setWorldBounds(new Rect(-50,-50,width+100,height+100));
}

