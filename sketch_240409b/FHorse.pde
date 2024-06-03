class FHorse extends FTerrain {//subclass
  int speed=2;

  FHorse(float x, float y) {
    super(x+gridSize/300, y+gridSize/300, "horse", true, false);
    attachImage(horse);




    //loop gif if we're at the end



    //set
    //attachImage(block[0]);
  }
  void act() {
    if (isTouching("player")) {
      h++;
      neigh.play();
      neigh.rewind();
      world.remove(this);
      terrain.remove(this);
    }
  }
}
