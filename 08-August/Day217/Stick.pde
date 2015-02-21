class Stick {

  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;

  int generations;
  String type;

  float angle1, angle2, angle3;

  Stick(Vec3D loc_, Vec3D vel_, int generations_, String type_) {
    loc = loc_;
    oriLoc = loc_.copy();
    vel = vel_;
    generations = generations_;
    type = type_;

    updateLoc();
    updateDir();
    spawn();
  }


  void spawn() {
    if (generations > 0) {

      if (type == "A") {
        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "B");  

        allSticks.add(newStick);

        Vec3D v2 = loc.copy();
        Vec3D initVel2 = vel.copy();
        Stick newStick2 = new Stick(v2, initVel2, generations-1, "A");  

        allSticks.add(newStick2);

        Vec3D v3 = loc.copy();
        Vec3D initVel3 = vel.copy();
        Stick newStick3 = new Stick(v3, initVel3, generations-1, "C");  

        allSticks.add(newStick3);
      }

      if (type == "B") {
        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "C");  

        allSticks.add(newStick);

        Vec3D v3 = loc.copy();
        Vec3D initVel3 = vel.copy();
        Stick newStick3 = new Stick(v3, initVel3, generations-1, "B");  

        allSticks.add(newStick3);
      }      

      if (type == "C") {
        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "A");  

        allSticks.add(newStick);
      }
    }
  }

  void updateDir() {
    if (type == "A") {

      float angle1 = radians(0);
      float angle2 = radians(a1);
      float angle3 = radians(0);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(350);
    }

    if (type == "B") {
      float angle1 = radians(0);
      float angle2 = radians(0);
      float angle3 = radians(a2);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(100);
    }

    if (type == "C") {

      float angle1 = radians(a3);
      float angle2 = radians(0);
      float angle3 = radians(0);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(1);
    }
  }

  void updateLoc() {
    loc.addSelf(vel);
  }

  void display() {
    stroke(0,40);
    strokeWeight(8);
    point(loc.x, loc.y, loc.z);
   
    stroke(255,75);
    strokeWeight(1);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
  }
}

