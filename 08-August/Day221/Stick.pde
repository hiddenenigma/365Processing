class Stick {

  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;

  int generations;
  String type;

  float angle1, angle2, angle3;

  Stick(Vec3D loc_, Vec3D vel_, int generations_, String type_, float angle1_, float angle2_, float angle3_) {
    loc = loc_;
    oriLoc = loc_.copy();
    vel = vel_;
    generations = generations_;
    type = type_;
    angle1 = angle1_;
    angle2 = angle2_;
    angle3 = angle3_;

    updateLoc();
    updateDir();
    spawn();
  }


  void spawn() {
    if (generations > 0) {

      if (type == "A") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "B", angle1, angle2, angle3);  

        allSticks.add(newStick);
      }

      if (type == "B") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "C", angle1, angle2, angle3);  

        allSticks.add(newStick);

      }      

      if (type == "C") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "A", angle1, angle2, angle3);  

        allSticks.add(newStick);

      }
    }
  }

  void updateDir() {
    if (type == "A") {

      vel.rotateX(0);
      vel.rotateY(angle1);
      vel.rotateZ(0);

      vel.normalize();
      vel.scaleSelf(15);
    }

    if (type == "B") {

      vel.rotateX(0);
      vel.rotateY(0);
      vel.rotateZ(angle2);

      vel.normalize();
      vel.scaleSelf(25);
    }

    if (type == "C") {

      vel.rotateX(angle3);
      vel.rotateY(0);
      vel.rotateZ(0);

      vel.normalize();
      vel.scaleSelf(45);
    }
  }

  void updateLoc() {
    loc.addSelf(vel);
  }

  void display() {
    stroke(255);
    strokeWeight(5);
    stroke(255,10);
    strokeWeight(1);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
  }
}

