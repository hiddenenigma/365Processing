/* Souce Cited:
 
 Plethora Project by Jose Sanchez
 Processing Season 2 - Tutorial 02: L-Systems
 http://www.plethora-project.com/
 Video tutorial: http://vimeo.com/22984904
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/



import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.geom.*;
import peasy.*;
import processing.opengl.*; 

PeasyCam cam;
VerletPhysics physics;
ArrayList<Chain> chains;
Chain chain;
Vec3D l;
Vec3D initVel;
float a = 0;
float a1 = radians(20);
float a2 = radians(53);
float a3 = radians(-100);

void setup() {
  size(500, 500, OPENGL);
  cam = new PeasyCam(this, 2200);
  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(-0.1, -0.1, -0.1)));
  chains = new ArrayList<Chain>();
}

void draw() {
  
//  saveFrame("output/frame####.png");
  background(255);

  rotateY(frameCount*0.01);
  rotateX(frameCount*0.01);
  rotateZ(frameCount*0.01);

  physics.update();  
  for (int i = -100; i < 100; i+= 50 ) {
      float angle = i * TWO_PI / 100;
      float x = cos(angle)*50;
      float y = sin(angle)*50;
      l = new Vec3D(0, 0, 0);
      initVel = new Vec3D(x,y,0);
      chain = new Chain(l, initVel, 10, "A", random(-120, 120), (int)random(1,50), random(10), random(0.1, 0.5));
      chains.add(chain);
  }
  
  for (Chain c : chains) {
    c.display();
  }
  
  a++;
  a1++;
  a2++;
  a3++;
}

