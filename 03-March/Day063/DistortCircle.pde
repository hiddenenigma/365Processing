class DistortCircle {
  float x, y, z;
  float angle;
  int numPoints;
  float radius;
  float yoff = 0.0;
  float theta = 0;
  float weight;
  float alpha;

  DistortCircle(int numPoints_, float radius_, float w, float a) {
    numPoints = numPoints_;
    radius = radius_;
    angle = TWO_PI / numPoints;
    weight = w;
    alpha = a;
  }

  void display() {
    PVector[] points = new PVector[numPoints];
    for (int i = 0; i < numPoints; i++) {
      float x = cos( angle * i ) * radius;
      float y = sin( angle * i ) * radius;
      float z = cos( angle * i ) * radius;
      points[i] = new PVector(x, y, z);
    }
    float xoff = 0; 
    float zoff = 0;       
    stroke(0);
    strokeWeight(weight);
    noFill();
    //    translate(width/2, 100);
    pushMatrix();
    rotateZ(theta);
    beginShape();
    for (int i = 0; i < numPoints; i++) {
      float y = map(noise(xoff, yoff), 0, 1, 50, 100); 
      float z = map(noise(yoff, zoff), 0, 1, 50, 300); 
      vertex(points[i].x, points[i].y+y, z);
      xoff += 0.05;
      zoff += 0.001;
    }
    endShape(CLOSE);
    yoff += 0.04; 
    theta += random(-0.01, 0.01);
    popMatrix();
  }
}
