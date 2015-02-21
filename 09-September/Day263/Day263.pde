import toxi.math.*;
import toxi.color.*;
import java.util.Iterator;
import peasy.*;

ArrayList<GradientShape> gshapes;
GradientShape gshape;
PeasyCam cam;

void setup() {
  size(500, 500, P3D);
  cam = new PeasyCam(this, 100);
  gshapes = new ArrayList<GradientShape>();
  for (int i = 0; i < 360; i+= 20) {
    gshape = new GradientShape(i);
    gshapes.add(gshape);
  }
}

void draw() {
//  saveFrame("output/frame####.png");
  background(255);
  rotate(frameCount*0.01);
  for (GradientShape gs : gshapes) {
    gs.run();
  }
}

