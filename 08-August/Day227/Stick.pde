class Stick {

  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;

  int generations;
  String type;

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
        Stick newStick2 = new Stick(v2, initVel2, generations-1, "C");  

        allSticks.add(newStick2);

        Vec3D v3 = loc.copy();
        Vec3D initVel3 = vel.copy();
        Stick newStick3 = new Stick(v3, initVel3, generations-1, "A");  

        allSticks.add(newStick3);
      }

      if (type == "B") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Stick newStick = new Stick(v, initVel, generations-1, "C");  

        allSticks.add(newStick);
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

      vel.rotateX(0);
      vel.rotateY(a1);
      vel.rotateZ(0);

      vel.normalize();
      vel.scaleSelf(a1);
    }

    if (type == "B") {

      vel.rotateX(0);
      vel.rotateY(0);
      vel.rotateZ(a1);

      vel.normalize();
      vel.scaleSelf(a1);
    }

    if (type == "C") {

      vel.rotateX(a1);
      vel.rotateY(0);
      vel.rotateZ(0);

      vel.normalize();
      vel.scaleSelf(a1);
    }
  }

  void updateLoc() {
    loc.addSelf(vel);
  }

  void display() {
    for (int i = 1; i <= 300; i++) {
      float angle = i * TWO_PI  / 300;        
      float x = cos(angle)*130;
      float y = sin(angle)*130;
      stroke(255, 10);
      strokeWeight(1);
      line(loc.x+x, loc.y+y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
    }
  }
}

