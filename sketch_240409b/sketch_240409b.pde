//Max Dodek
//April 9, 2024
//**use this website:                             https://www.pixilart.com/draw                                      **\\
//------------------------basic setup------------------------
//spcfc program = fisica
//change--> just change one pixel at time
// ez gif
//make game so that the oject floats smoothly

//ASK FOR WHY THIS NOT WORKING\\
//******how to randomize?????*&*&****

//1.why is none of gifs working???
//2. ***timer,nor click***==> going to/fro shoes-game;;
//why clicks not working???
//(try on own)image

import fisica.*;
FWorld world;
FPlayer player;
ArrayList<FGameObject> terrain;
Button reg, noExplo;





// for Utilities
boolean leftkey, rightkey, upkey, downkey, spacekey;//what do? //p2
boolean akey, dkey, wkey, skey;
boolean wasPressed;
boolean mouseReleased;

//music

//mode framework
int mode;
final int INTRO =1; // final makes it so that these can't change anymore
final int GAME = 2;
final int PAUSE =3;
final int GAMEOVER = 4;



//import music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer intro, game, blowup, neigh;

//traget variables (?)


//colour Pallete
color white = #FFFFFF;
color black = #000000;
color red = #ed1c24;
color purple = #bb00ff;
color brown = #572a1a;
color grey = #666666;
color orange=#ff5500;
color cTop=#66ff00;


//obsticles
//maze
PImage maze;//map
PImage wall, box, shoes, horse, wblock;
//'terains'= objects
//images


//maze basics
int gridSize=32;//size of fboxes load in--> can always chnge
//gifs
PImage [] explode, horses;
int nframes;
int f;




int timer;
int plTimer;
int pairs;
int h, sh;



void setup() {
  //size (1000, 1000);
  fullScreen();
  Fisica.init(this);//this initialize Fisica
  terrain = new ArrayList<FGameObject>();
  world=new FWorld (-2000, -2000, 2000, 2000);//(top left cordinate, bottum )
  textAlign(CENTER);

  //world.setGravity(0, 90000000);  //functions:- this what called???
  loadImages();
  loadSound();
  loadgifs();
  loadButtons();
  makeWorld(maze);
  makePlayer();
  maze.get(0, 0);//??

  timer = 50;
  plTimer=timer;
  h=0;
  sh=0;

  mode = INTRO;

  ////done this properly?****------------------------------??????????????????___+===============
  //map.width//tell how long image is
  //map.height//tell height of image
}

void makeWorld(PImage img) { //review back minute 2:18vid 4(player)
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      //color c=maze.get(x, y);
      color c= img.get(x, y);// do this so can look around image to get context
      color s=img.get(x, y+1);//color below current pixel
      color w =img.get(x-1, y);
      color e =img.get(x+1, y);

      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c==black) {
        b.attachImage(wall);//add in
        b.setName("wall");// make wall
        world.add(b);//what b again?
      } else if (c==grey) {//money block
        FBomb blk = new FBomb(x*gridSize, y*gridSize);
        terrain.add(blk);
        world.add(blk);
        //world.add(blk);
      } else if (c==orange) {//money block
        FShield shld = new FShield(x*gridSize, y*gridSize);
        terrain.add(shld);
        world.add(shld);
      } else if (c==purple) {
        FShoes shs = new FShoes(x*gridSize, y*gridSize);
        terrain.add(shs);
        world.add(shs);//what b again?
      } else if (c==brown) {
        FHorse hrs = new FHorse(x*gridSize, y*gridSize);
        terrain.add(hrs);
        world.add(hrs);
      } else if (c==cTop) {
        b.attachImage(wall);//add in
        b.setName("tWall");// make wall
        world.add(b);
      } else if (c==red) {
        b.setName("invBomb");// make wall
        b.attachImage(wblock);//add in
        world.add(b);
      }


      //if (c==grey) {
      //  //b.setPosition(x*gridSize/10, y*gridSize/10);
      //  b.attachImage(box);//add in
      //  b.setName("box");// make wall
      //  world.add(b);//what b again?
      //}
    }
  }
  //***add here the spcfc elements**
}

void loadImages() {
  maze=loadImage("maze.png");
  wall=loadImage("brick.png");
  box=loadImage("box.png");
  box.resize(gridSize, gridSize);
  shoes=loadImage("shoes.png");
  horse=loadImage("horse.png");
  horse.resize(gridSize, gridSize);
  wblock=loadImage("wblck.png");
}

void loadButtons() {
  textSize(20);
  reg = new Button("Game", width/2-200, height/2+200, 150, 75, white, red); //text, x,y, w,h, higlight,normal
  noExplo = new Button("Demo", width/2+200, height/2+200, 150, 75, white, red); //text, x,y, w,h, higlight,normal
}

//void initgifs( ) {
//  // gif
//nframes= 10;
//horse = new PImage [nframes];
//int i=0;
//while (i<nframes) {
//  explode[i]=loadImage("frame_0"+i+"_delay-0.2s.jpg");//***FIX TO CORRECT***
//  i++;
//}
//}

void makePlayer() {
  player=new FPlayer();
  world.add(player);
}

void loadgifs() {
  //EXPLODE
  int nframes= 17;
  explode = new PImage [nframes];
  int i=0;
  while (i<nframes) {
    explode[i]=loadImage("frame_"+i+"_delay-0.01s.gif");
    i++;
  }

  //horse
  nframes= 15;
  horses = new PImage [nframes];

  i=0;
  while (i<nframes) {
    horses[i]=loadImage("frame_"+i+"_delay-0.1s.gif");
    //horses[i].resize(gridSize, gridSize);
    i++;
  }
}



void loadSound() {
  minim = new Minim (this);
  game = minim.loadFile("shelter.mp3");
  intro = minim.loadFile("city.mp3");
  blowup = minim.loadFile("explosion.mp3");
  neigh = minim.loadFile("horse.mp3");
}

void draw () { // After draw, I can do void intro, void game, etc. instead of using tabs
  click();// fix this
  //world.step();//??

  actWorld();

  if (mode==INTRO) {
    intro();
  } else if (mode ==GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println("Mode error:"+ mode);
  }
}// these are seperate modes for different parts of game


void actWorld() {
  player.act();
  player.show();
  for (int i=0; i< terrain.size(); i++) {
    FGameObject t= terrain.get(i);
    t.act();
  }
}







//void drawWorld() {
//  float zoom=1;
//  pushMatrix();
//  translate(player.getX(),player.getY());
//  //translate(-player.getX()*zoom+width/2, -player.getY()*zoom +height/2);
//  //scale(zoom);//zoom
//  world.step();

//  world.draw();
//  popMatrix();
//}
