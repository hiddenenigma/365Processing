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

        Vec3D v2 = loc.copy();
        Vec3D initVel2 = vel.copy();
        Stick newStick2 = new Stick(v2, initVel2, generations-1, "C", angle1, angle2, angle3);  

        allSticks.add(newStick2);
        
        Vec3D v3 = loc.copy();
        Vec3D initVel3 = vel.copy();
        Stick newStick3 = new Stick(v3, initVel3, generations-1, "A", angle1, angle2, angle3);  

        allSticks.add(newStick3);
      }

      if (type == "B") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "C", angle1, angle2, angle3);  

        allSticks.add(newStick);

        Vec3D v2 = loc.copy();
        Vec3D initVel2 = vel.copy();
        Stick newStick2 = new Stick(v2, initVel2, generations-1, "A", angle1, angle2, angle3);  

        allSticks.add(newStick2);
      }      

      if (type == "C") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "A", angle1, angle2, angle3);  

        allSticks.add(newStick);

        Vec3D v2 = loc.copy();
        Vec3D initVel2 = vel.copy();
        Stick newStick2 = new Stick(v2, initVel2, generations-1, "B", angle1, angle2, angle3);  

        allSticks.add(newStick2);
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
      vel.scaleSelf(35);
    }
  }

  void updateLoc() {
    loc.addSelf(vel);
  }

  void display() {
    stroke(255, 5);
    strokeWeight(1);
    line(vel.x, vel.y, vel.z, loc.x, loc.y, loc.z);
    stroke(255, 15);
    strokeWeight(10);
    point(vel.x, vel.y, vel.z);
  }
}

