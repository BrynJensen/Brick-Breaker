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

  //SCORE AND LIVES FLASHING
  if (blinkL == true) {
    text("Lives: " + lives, 60, 30);
  }

  if (blinkS == true) {
    text("Score: " + score, width - 75, 30);
  }

  if (countL == true) counterL++;
  if (countS == true) counterS++;
  if (counterL > 120) counterL = 0;
  if (counterS > 60) counterS = 0;

  if (counterL < 120 && frameCount % 12 == 0 && counterL != 0 && countL == true) {
    blinkL = !blinkL;
  } else if (counterL == 0) {
    blinkL = true;
    counterL = 0;
    countL = false;
  }

  if (counterS < 60 && frameCount % 12 == 0 && counterS != 0 && countS == true) {
    blinkS = !blinkS;
  } else if (counterS == 0) {
    blinkS = true;
    counterS = 0;
    countS = false;
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
  } else if (by > height) { //LOSE LIFE AND RESET
    lives = lives - 1;
    countL = true;
    counterL = 0;

    bx = width/2;
    px = random(width/2 - 45, width/2 + 45);
    by = height - 125;
    bvx = 0;
    bvy = 1;

    bump.play();
    bump.rewind();
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

//DRAW BRICKS
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }

  //END GAME
  if (lives == 0 || score == 4500) {
    noStroke();
    fill(darkTeal);
    rect(0, 0, height, 50);

    fill(white);
    textSize(26);
    text("Lives: " + lives, 60, 30);
    text("Score: " + score, width - 75, 30);

    mode = GAMEOVER;
  }
}

void gameClicks() {
  mode = PAUSE;
}

void manageBrick (int i) {
  //set different colour as the row changes
  if (y[i] == 150) bc = lightOrange;
  if (y[i] == 225) bc = darkOrange;
  if (y[i] == 300) bc = maroon;
  if (y[i] == 375) bc = violet;
  if (y[i] == 450) bc = red;

  //draw the bricks
  noStroke();
  fill(bc);
  circle(x[i], y[i], brd);

  //brick bouncing
  if (dist(bx, by, x[i], y[i]) <= bd/2 + brd/2) {
    bvx = (bx - x[i])/5;
    bvy = (by - y[i])/5;
    alive[i] = false;
    score += 100;
    countS = true;
    counterS = 0;
    coin.play();
    coin.rewind();
  }
}
