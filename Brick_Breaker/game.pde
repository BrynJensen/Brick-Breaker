void game() {
  background(darkTeal);

  //DRAW PADDLE
  fill(white);
  circle(px, py, pd);

  //DRAW BALL
  fill(white);
  noStroke();
  circle(bx, by, bd);

  by = by + bvy;
  bx = bx + bvx;

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
    by = height - 200;
    bvx = 0;
    bvy = 1;
  }


  //BALL PADDLE COLISION
  if (dist(bx, by, px, py) <= bd/2 + pd/2) {
    bvx = (bx - px)/10;
    bvy = (by - py)/10;
  }

  //MOVE PADDLE
  if (akey == true) px = px - 8;
  if (dkey == true) px = px + 8;

  if (px < -1 * pd/2) px = width + pd/2;
  if (px > width + pd/2) px = -1 * pd/2;

  //BRICKS
  //circle(x[0], y[0], brd);
  //circle(x[1], y[1], brd);
  //circle(x[2], y[2], brd);

  int i = 0;
  while (i < n) {
    circle(x[i], y[i], brd);
    if (dist(bx, by, x[i], y[i]) <= bd/2 + bd/2) {
      bvx = (bx - x[i])/4.5;
      bvy = (by - y[i])/4.5;
    }
    i = i + 1;
  }
}

void gameClicks() {
}
