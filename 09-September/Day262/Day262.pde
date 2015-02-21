/* Source Cited:
 
 Toxiclibs Library Example
 Spherical Harmonics Mesh Builder
 
*/

import toxi.geom.mesh.*;
import toxi.geom.*;
import processing.opengl.*;
import peasy.*;
import java.util.Iterator;

PeasyCam cam;

TriangleMesh mesh = new TriangleMesh();
Matrix4x4 normalMap = new Matrix4x4().translateSelf(128, 128, 128).scaleSelf(127);

boolean isWireFrame;
boolean showNormals;
float radius;
float a, c1, c2;

void setup() {
  size(500, 500, OPENGL);
  cam = new PeasyCam(this, 100);
  fill(255);
  noStroke();
} 

void draw() {
//  saveFrame("output/frame####.png");
  background(0); 
  randomizeMesh();
  update();
  drawMesh(g, mesh, !isWireFrame, showNormals);
}

void update() {
  rotateX(radians(90));

  float m = millis();
  radius = (int)((((220+sin(m/2500)*250))/6 ));  
  a += 0.01;
  c1 = ((((255+sin(m/300)*255))));
  c2 = noise(frameCount * 0.01) * 200;
}

void drawMesh(PGraphics gfx, TriangleMesh mesh, boolean vertexNormals, boolean showNormals) {
  gfx.beginShape(PConstants.TRIANGLES);
  AABB bounds=mesh.getBoundingBox();
  Vec3D min=bounds.getMin();
  Vec3D max=bounds.getMax();
  if (vertexNormals) {
    for (Iterator i=mesh.faces.iterator (); i.hasNext(); ) {
      Face f=(Face)i.next();
      Vec3D n = normalMap.applyTo(f.a.normal);
      gfx.fill(255);
      gfx.normal(f.a.normal.x, f.a.normal.y, f.a.normal.z);
      gfx.vertex(f.a.x, f.a.y, f.a.z);
      n = normalMap.applyTo(f.b.normal);
      gfx.fill(255);
      gfx.normal(f.b.normal.x, f.b.normal.y, f.b.normal.z);
      gfx.vertex(f.b.x, f.b.y, f.b.z);
      n = normalMap.applyTo(f.c.normal);
      gfx.fill(255);
      gfx.normal(f.c.normal.x, f.c.normal.y, f.c.normal.z);
      gfx.vertex(f.c.x, f.c.y, f.c.z);
    }
  } else {
    for (Iterator i=mesh.faces.iterator (); i.hasNext(); ) {
      Face f=(Face)i.next();
      gfx.normal(f.normal.x, f.normal.y, f.normal.z);
      gfx.vertex(f.a.x, f.a.y, f.a.z);
      gfx.vertex(f.b.x, f.b.y, f.b.z);
      gfx.vertex(f.c.x, f.c.y, f.c.z);
    }
  }
  gfx.endShape();
  if (showNormals) {
    if (vertexNormals) {
      for (Iterator i=mesh.vertices.values ().iterator(); i.hasNext(); ) {
        Vertex v=(Vertex)i.next();
        Vec3D w = v.add(v.normal.scale(10));
        Vec3D n = v.normal.scale(127);
        gfx.stroke(n.x + 128, n.y + 128, n.z + 128);
        gfx.line(v.x, v.y, v.z, w.x, w.y, w.z);
      }
    } else {
      for (Iterator i=mesh.faces.iterator (); i.hasNext(); ) {
        Face f=(Face)i.next();
        Vec3D c = f.a.add(f.b).addSelf(f.c).scaleSelf(1f / 3);
        Vec3D d = c.add(f.normal.scale(20));
        Vec3D n = f.normal.scale(127);
        gfx.stroke(n.x + 128, n.y + 128, n.z + 128);
        gfx.line(c.x, c.y, c.z, d.x, d.y, d.z);
      }
    }
  }
}

void randomizeMesh() {

  float[] m = {
    radius, 7, 7, radius, 7, 7, 7, 7
  };
  SurfaceMeshBuilder b = new SurfaceMeshBuilder(new SphericalHarmonics(m));
  mesh = (TriangleMesh)b.createMesh(null, int(a)+50, 100);
}


