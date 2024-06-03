class FBomb extends FTerrain {//subclass

  FBomb(float x, float y) {
    super(x+gridSize/300, y+gridSize/300, "bomb", true, false);
    attachImage(box);
  }
  void act() { // what wrong****

    //int f=0;
    //if (isTouching("player")) {
    //image(explode[f], width/2, height/2, width, height);
    //if (frameCount % 2==0) f++;




    //}
  }
}
//}
