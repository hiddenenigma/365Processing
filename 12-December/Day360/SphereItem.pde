class SphereItem {

  float r, theta, phi, thetaSpeed, phiSpeed, ang, scalar;
  float itemSize = 5;
  PVector loc;

  SphereItem(float r_, float theta_, float phi_) {
    theta = theta_;
    phi = phi_;
    itemSize = random(3);
    thetaSpeed = random(-0.01, 0.01);
    phiSpeed = random(-0.01, 0.01);  
    scalar = 200;
    loc = new PVector(); 
  }

  void connect(ArrayList<SphereItem> sphereItems) {
    for (SphereItem other : sphereItems) {
      float d = PVector.dist(loc, other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < 60)) {
        stroke(0, 60-d);
        line(loc.x, loc.y, loc.z, other.loc.x, other.loc.y, other.loc.z);
      }
    }
  }

  void update() {
    r = scalar * sin(ang);
    float x = cos(theta) * sin(phi) * r;
    float y = sin(theta) * sin(phi) * r;
    float z = cos(phi) * r;
    loc.x = x;
    loc.y = y;
    loc.z = z;
    theta += thetaSpeed;
    phi += phiSpeed;
    ang += 0.005;
  }

  void render() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(0);
    noStroke();
    sphere(itemSize);
    popMatrix();
  }
}

