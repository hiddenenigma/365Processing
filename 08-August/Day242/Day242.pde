/* Souce Cited:
 
 The Nature of Code by Daniel Shiffman
 Chapter 5: Physics Libraries
 http://natureofcode.com/
 
*/

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import processing.opengl.*;

VerletPhysics2D physics;
ArrayList<Attractor> attractors;
AttractionBehavior mouseAttractor;
Vec2D mousePos;

ArrayList<Chain> chains;
float emit = 50;
float radius = 20;

void setup() {
  size(500, 500);
  smooth(8);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  chains = new ArrayList<Chain>();
  for (int i = 0; i < 250; i++) {
    chains.add(new Chain(10,10,random(1,5),0.01,0,i));
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  physics.update();  
  for (Chain c : chains) {
    c.display();
  }
}

void mousePressed() {
  mousePos = new Vec2D(mouseX, mouseY);
  mouseAttractor = new AttractionBehavior(mousePos, 250, 0.09f);
  physics.addBehavior(mouseAttractor);
}

void mouseDragged() {
  mousePos.set(mouseX, mouseY);
}

void mouseReleased() {
  physics.removeBehavior(mouseAttractor);
}
  
