class Fractal {

  Vec3D pt1, pt2;
  VerletParticle part1, part2;
  float angle, sw, a;
  float scalar = 450;
  float ang;
  
  Fractal(Vec3D pt1_, Vec3D pt2_, float sw_) {
    pt1 = pt1_;
    pt2 = pt2_;
    sw = sw_;
    angle = 60;
  }

  void run() {
    update();
    iterate(pt1, pt2, 1);
  }

  void update() {
    pt2.z = scalar * sin(ang);
    Vec3D m = new Vec3D(mouseX, mouseY, 0);
    float d2 =m.distanceTo(pt2);
    ang += 0.02;
  }

  void iterate(Vec3D p1, Vec3D p2, int iterations) {

    if (iterations > 0) {
      Vec3D oneQuarter = ptBetween(p1, p2, 0.25, 0);
      Vec3D threeQuarter = ptBetween(p1, p2, 0.75, 0);
      Vec3D halfUp = ptBetween(p1, p2, 0.5, 0);
      
      iterate(p1, oneQuarter, iterations-1);
      iterate(oneQuarter, halfUp, iterations-1);
      iterate(halfUp, threeQuarter, iterations-1);
      iterate(threeQuarter, p2, iterations-1);

      if (iterations == 1) {
        strokeWeight(sw);
        vLine(p1,oneQuarter);
        vLine(oneQuarter,halfUp);
        vLine(halfUp,threeQuarter);
        vLine(threeQuarter,p2);
      }
    }
  }

  Vec3D ptBetween(Vec3D p1, Vec3D p2, float ratio, float ratio2) {

    Vec3D dif = p2.sub(p1);
    float d = p1.distanceTo(p2);

    dif.normalize();
    dif.scaleSelf(d*ratio);

    Vec3D rot = p2.sub(p1);
    rot.normalize();
    rot.rotateZ(radians(angle));
    rot.scaleSelf(d*ratio2);

    dif.addSelf(rot);
    dif.addSelf(p1);

    return dif;
  }

  void vLine(Vec3D v1, Vec3D v2) {
    line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
  }

  void vPt(Vec3D v) {
    point(v.x, v.y, v.z);
  }
}

