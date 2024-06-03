class FTerrain extends FGameObject {//subclass
  FTerrain(float x, float y, String a, Boolean b, Boolean c ) {//setPosition, name, static, sensor
    super();
    setPosition(x, y);
    setName(a);
    setStatic(b);
    setSensor(c);
    //setFriction();
  }

  void act() {
    //if (ifTouch("player")) {
    //  setStatic(false);
    //  setSensor(true);
    //}
  }
 
}
