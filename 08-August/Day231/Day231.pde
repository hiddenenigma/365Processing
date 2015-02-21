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

Attractor attractor;

ArrayList<Chain> chains;
Chain chain;
Vec3D l;
Vec3D initVel;
float a = 0;
float a1 = radians(0);
float a2 = radians(0);
float a3 = radians(0);

void setup() {
  size(500, 500, OPENGL);

  cam = new PeasyCam(this, 250);
  physics = new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(-0.01, -0.01, -0.01)));
  chains = new ArrayList<Chain>();
  for (int i = 0; i < 25; i++ ) {
      float angle = i * TWO_PI / 100;
      float x = cos(angle)*10;
      float y = sin(angle)*10;
      l = new Vec3D(random(-5,5),random(-5,5),random(-5,5));
      initVel = new Vec3D(1,0,0);
      chain = new Chain(l, initVel, 3, "A", random(-150, 150), (int)random(25,100), random(5), random(0.1, 0.5));
      chains.add(chain);
    }  
  attractor = new Attractor(new Vec3D(0,0,0));
}

void draw() {
 
//  saveFrame("output/frame####.png");
  
  rotateY(frameCount*0.01);
  rotateX(frameCount*0.01);
  rotateZ(frameCount*0.01);

  // need to update the world in order to make sure the phyics engine works
  physics.update();  
//  chains.clear(); 

//  }
  
  background(255);
  for (Chain c : chains) {
    c.display();
  }
//  a+= 0.1;
  a1++;
  a2++;
  a3++;
}

