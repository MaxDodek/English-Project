void game () {
  game.play();
  background(white);
  int t=20;
  t--;

  drawWorld();
  collecting();

  //dieing
  if (hitground(player)==false) plTimer--;
  if (hitground(player)==true)plTimer=timer;
  if ( plTimer ==-200) player.lives=0;
  if (reg.clicked) {
    if ( plTimer ==0) player.lives=0;

    if (player.isTouching("tWall"))bombing();
    if (player.isTouching("bomb" )) bombing();
    if (player.isTouching("invBomb" )) bombing();
  }
}


void gameClicks () {
}

void drawWorld() {
  float zoom=6;
  pushMatrix();
  translate(-player.getX()*zoom+width/4, -player.getY()*zoom +height/4);
  scale(zoom);//zoom
  world.step();
  world.draw();
  popMatrix();
}
void random() {
}
void collecting() {
  textSize(15);
  text("Lives:" +player.lives, width/9, height/7.5);
  if (sh==0) text("You have no comfortable shoes...yet", width/9, height/6.5);
  if (sh==1) text("You have aquired one luxury... a pair of shoes", width/9, height/6.5);
  if (sh>=2) text("Yay! You Have aquired "+sh+" pairs of shoes...", width/9, height/6.5);


  if (h==0) text("You have left all of the horses to suffer", width/9, height/4.5);
  if (h==1) text("You have put one horse out of its misery ", width/9, height/4.5);
  if (h>=2) text("You have put "+h+" horses out of their misery", width/9, height/4.5);
}

void bombing() {
  blowup.play();
  blowup.rewind();
  background(white);
  if (f==17)f=0;
  image(explode[f], 0, 0, width, height);
  if (frameCount % player.speed==0) f++;

  player.lives=0;
}
//void gameEngine() {
//  int i=0;
//  while (i<terrain.size()) {
//    FTerrain trn = terrain.get(i);
//    trn.act();

//    if (lives==0) {
//      terrain.remove(i);
//    } else {
//      i++;
//    }
//  }
//}
