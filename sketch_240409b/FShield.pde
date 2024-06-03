class FShield extends FTerrain {//subclass
int randomNum;// make range

  FShield(float x, float y) {
    super(x+gridSize/300, y+gridSize/300, "shield", true, false);
    attachImage(box);
    randomNum= (int) random(0, 6);
  }
  void act() { // what wrong****

    //int f=0;
    if (isTouching("player")) {
      player.lives = randomNum;
      world.remove(this);
      terrain.remove(this);
    }
  }
}
