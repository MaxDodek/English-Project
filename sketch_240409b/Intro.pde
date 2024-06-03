void intro () {
  intro.play();

  background(white);
  reg.show();
  noExplo.show();
  fill(red);
  textAlign(CENTER);
  textSize(100);
  text("Welcome to war...", width/2, height/7);
  textSize(20);
  text(" The 'demo' mode simply makes a lower chance of death, so one can explore the game in more detail.", width/2, height/2);
  text(" Enjoy gathering differnt items. However, there is a high chance of death ('reg' mode).", width/2, height/1.2);



  introClicks();
}

void introClicks () {
  if (reg.clicked) mode=GAME;

  if (noExplo.clicked) mode=GAME;



  //checkForClick(0, width, 0, height);
  //if (clicked) {
  //  mode = GAME;
  //  intro.pause();
  //}
}
