//keyboard
void keyPressed() {
  if (key=='a'|| key =='A') akey=true;
  if (key=='d'|| key=='S') dkey=true;
  if (key=='w'|| key =='W') wkey=true;
  if (key=='s'|| key=='S') skey=true;
  if (key==' ')spacekey=true;

  if (keyCode == UP) upkey=true;
  if (keyCode == DOWN) downkey=true;
  if (keyCode == LEFT) leftkey=true;
  if (keyCode == RIGHT) rightkey=true;
  if (keyCode == ' ') spacekey=true;
}

void keyReleased() {
  if (key=='a'|| key =='A') akey=false;
  if (key=='d'|| key=='S') dkey=false;
  if (key=='w'|| key =='W') wkey=false;
  if (key=='s'|| key=='S') skey=false;
  if (key==' ')spacekey=false;

  if (keyCode == UP) upkey=false;
  if (keyCode == DOWN) downkey=false;
  if (keyCode == LEFT) leftkey=false;
  if (keyCode == RIGHT) rightkey=false;
  if (keyCode == ' ') spacekey=false;
}

PImage reverseImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );
  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}


boolean clicked;
void checkForClick(int a, int b, int c, int d) {
  if (mouseReleased && mouseX > a && mouseX < b && mouseY > c && mouseY < d) {
    clicked  = true;
  } else {
    clicked = false;
  }
}



boolean hitground(FBox b) {
  ArrayList<FContact> contactList = player.getContacts();
  if (contactList.size()>0) {
    return true;
  }
  return false;
}
