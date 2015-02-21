class Fractal {

  Vec3D pt1, pt2;
  float angle, sw;

  Fractal(Vec3D pt1_, Vec3D pt2_, float sw_) {
    pt1 = pt1_;
    pt2 = pt2_;
    sw = sw_;
  }

  void run() {
    display();
    update();
    iterate(pt1, pt2, 5);
  }

  void update() {
    angle ++;
    Vec3D m = new Vec3D(mouseX, mouseY, 0);
    float d1 =m.distanceTo(pt1);

    if (mousePressed) {
      if (d1 < 30) {
        pt1 = m;
      }
    }
    float d2 =m.distanceTo(pt2);

    if (mousePressed) {
      if (d2 < 30) {
        pt2 = m;
      }
    }
  }

  void iterate(Vec3D p1, Vec3D p2, int iterations) {

    if (iterations > 0) {
      Vec3D oneThird = ptBetween(p1, p2, 0.25, 0);
      Vec3D twoThird = ptBetween(p1, p2, 0.75, 0);
      Vec3D halfUp = ptBetween(p1, p2, 0.5, -0.2);

      iterate(p1, oneThird, iterations-1);
      iterate(oneThird, halfUp, iterations-1);
      iterate(halfUp, twoThird, iterations-1);
      iterate(twoThird, p2, iterations-1);

      if (iterations == 1) {
        vLine(p1, oneThird);
        vLine(oneThird, halfUp);
        vLine(halfUp, twoThird);
        vLine(twoThird, p2);
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

  void display() {
    strokeWeight(sw);
  }

  void vLine(Vec3D v1, Vec3D v2) {
    line(v1.x, v1.y, v2.x, v2.y);
  }

  void vPt(Vec3D v) {
    point(v.x, v.y);
  }
}

