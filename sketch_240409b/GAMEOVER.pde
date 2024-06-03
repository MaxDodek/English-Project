void gameover() {
  background(white);
  fill(red);
  textAlign(CENTER, CENTER);
  textSize(width/40);
  text("I regret to inform you that you have died.", width/2, height/2);
  //gameoverClicks();
  gameoverClicks ();
}

void gameoverClicks () {//***why not work***
  checkForClick(0, width, 0, height);
  if (clicked) {
    game.rewind();
    mode = INTRO;
    game.pause();
    setup();
    //game.pause();
  }
  //if mouseReleased(true)
}
