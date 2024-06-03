class FShoes extends FTerrain {//subclass

  FShoes(float x, float y) {
    super(x+gridSize/300, y+gridSize/300, "shoes", true, false);
    attachImage(shoes);
  }

  void act() { // what wrong****
    if (isTouching("player")) {
      sh++;
      world.remove(this);
      terrain.remove(this);
    }
  }
}
