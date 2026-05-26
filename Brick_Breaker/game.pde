void game() {
  background(darkTeal);

  //DRAW PADDLE
  noStroke();
  fill(white);
  circle(px, py, pd);

  //DRAW BALL
  fill(white);
  noStroke();
  circle(bx, by, bd);

  by = by + bvy;
  bx = bx + bvx;
  
  //SCORE AND LIVES DISPLAY
  textSize(26);
  fill(white);
  noStroke();
  
  text("Score: " + score, width - 75, 30);
  text("Lives: " + lives, 60, 30);
  
  //LIVES
  if (bx > height) {
   lives -= 1; 
  }

  //BALL COLISIONS
  if (bx < bd/2) {
    bvx = -1 * bvx;
    bx = bd/2;
  } else if (bx > width - bd/2) {
    bvx = -1 * bvx;
    bx = width - bd/2;
  } else if (by < bd/2) {
    bvy = -1 * bvy;
    by = bd/2;
  } else if (by > height - bd/2) {
    lives = lives - 1;
    bx = width/2;
    px = width/2;
    by = height - 125;
    bvx = 0;
    bvy = 1;
  }


  //BALL PADDLE COLISION
  if (dist(bx, by, px, py) <= bd/2 + pd/2) {
    bvx = (bx - px)/10;
    bvy = (by - py)/10;
  }

  //MOVE PADDLE
  if (akey == true) px = px - 5;
  if (dkey == true) px = px + 5;

  if (px < -1 * pd/2) px = width + pd/2;
  if (px > width + pd/2) px = -1 * pd/2;


  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }
  
  //END GAME
  if (lives == 0 || score == 4500) mode = GAMEOVER;
}

void gameClicks() {
  mode = PAUSE;
}
