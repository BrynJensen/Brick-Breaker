//Bryn Jensen
//2-1
//Brick Breaker


import processing.javafx.*;

//MINIM
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//SOUND VARIABLES
Minim minim;
AudioPlayer theme, coin, bump;

//GIF LOADING
PImage[] gif;
int f = 12;
int frame = 0;

//COLOUR PALLETTES
color white = #FFFFFF;
color black = #000000;
color red = #FF0000;

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

//KEYBOARD VARIABLES
boolean akey, dkey;

//GAME VARIABLES
int score = 0; //TRACK SCORE
int lives = 3; //TRACK LIVES
float text = 80; //TEXT SIZE CHANGER
boolean blink; //FLASH TEXT IN GAME OVER
boolean blinkL = true; //FLASH LIVES TEXT
boolean blinkS = true; //FLASH SCORE TEXT
int counterL = 0; //COUNTER FOR LIVES FLASH
int counterS = 0; //COUNTER FOR SCORE FLASH
boolean countL = false;
boolean countS = false;

boolean textS = true; //TEXT SIZE CHANGE TRACK

//BRICK VARIABLES
int[] x;
int[] y;
boolean[] alive;

float brd; //BRICK DIAMETER
color bc; //BRICK FILL

int n;
int tempx, tempy;

void setup() {
  size(800, 800, FX2D);
  mode = INTRO;

  textAlign(CENTER);

  //ENTITY INITIALIZATION
  //PADDLE
  px = random(width/2 - 45, width/2 + 45);
  py = height;
  pd = 100;

  //BALL
  bx = width/2;
  by = height - 125;
  bd = 20;
  bvx = 0;
  bvy = 1;
  bc = lightOrange;
  //KEYBOARD VARIABLES INITIALIZATION
  dkey = akey = false;

  //FONT LOADING
  PFont font = createFont("Wheel Turn.otf", 200);
  textFont(font);

  //SETUP ARRAY OF BRICKS
  n = 45;
  brd = 40;

  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 150;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    i = i + 1;
    tempx += 75;
    if (tempx >= width - 50) {
      tempy += 75;
      tempx = 100;
    }
  }

  //SETUP GIF ARRAY
  gif = new PImage[f];

  int l = 0;
  while (l < f) {
    gif [l] = loadImage("frame_"+l+"_delay-0.07s.gif");
    l++;
  }

  //MINIM
  minim = new Minim(this);
  theme = minim.loadFile("MUSIC.mp3");
  coin = minim.loadFile("SUCCESS.wav");
  bump = minim.loadFile("FAILURE.wav");
  theme.loop();
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
