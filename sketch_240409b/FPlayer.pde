class FPlayer extends FGameObject {//fplayer is FBox--> can do evrythng wuld od w/ FBox
  int lives;
  float speed;
  FPlayer() {
    super();//must use FBox constructer -->//make super class for this later***
    setFillColor(red);
    setName("player");
    lives = 1;
    speed=0.5;
  }
  void act() {//WE MUST CALL ACT FUNCTION IN ORDER FOR IT TO WORK***
    handleInput();
    //if (offScreen()) lives = 0;





    if (lives ==0)mode = GAMEOVER; 
  }



  void handleInput() {
    float vx= getVelocityX();
    float vy =getVelocityY();
    int n = 100;
    if (upkey) setVelocity(vx, -n); // do this w/ velocity's appropriate for my prjct}
    if (downkey) setVelocity(vx, n);
    if (leftkey) setVelocity(-n, vy);
    if (rightkey) setVelocity(n, vy);
  }
  void show() {
    int timer =100;
    //if (isTouching("shoes")) ;
  }


  //boolean offScreen() {
  //  //return (x<0|| x>width||y<-50||y>height); //return =_____.
  //}
}
