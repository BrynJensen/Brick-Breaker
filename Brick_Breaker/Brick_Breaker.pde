//Bryn Jensen
//2-1
//Brick Breaker
//breakout pt3 6:05

//MINIM
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//SOUND VARIABLES
Minim minim;
AudioPlayer theme, coin, bump, gameover;


//COLOUR PALLETTES
color white = #FFFFFF;
color black = #000000;

//1
color lightCyan = #caf0f8;
color mediumBlue = #90e0ef;
color turquise = #00b4d8;
color darkerBlue = #0077b6;
color navy = #03045e;

//2
color darkTeal = #0f4c5c;
color darkOrange = #e36414;
color lightOrange = #fb8b24;
color maroon = #9a031e;
color violet = #5f0f40;


//MODE FRAMEWORK
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

//ENTITY VARIABLES
float px, py, pd; //PADDLE
float bx, by, bd; //BALL
float bvx, bvy; //BALL VELOCITY
float brd; //BRICK DIAMETER

//KEYBOARD VARIABLES
boolean akey, dkey;

//GAME VARIABLES
int score, lives;
float text = 80;

boolean textS = true;

//BRICK VARIABLES
int[] x;
int[] y;

int n;
int tempx, tempy;

void setup() {
  size(800, 800, P2D);
  mode = INTRO;

  textAlign(CENTER);

  //ENTITY INITIALIZATION
  //PADDLE
  px = width/2;
  py = height;
  pd = 100;

  //BALL
  bx = width/2;
  by = height - 200;
  bd = 20;
  bvx = 0;
  bvy = 1;
  //KEYBOARD VARIABLES INITIALIZATION
  dkey = akey = false;

  //FONT LOADING
  PFont font = createFont("Wheel Turn.otf", 200);
  textFont(font);

  //SETUP ARRAY OF BRICKS
  n = 28;
  brd = 40;

  x = new int[n];
  y = new int[n];
  tempx = 100;
  tempy = 100;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    i = i + 1;
    tempx += 100;
  }
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: Mode = " + mode);
  }
}
