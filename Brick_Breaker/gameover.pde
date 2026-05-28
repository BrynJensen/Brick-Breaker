void gameover() {
  theme.pause();
  theme.rewind();

  //TEXT COVER FOR BLINK
  //TEXT COVER RECT
  fill(darkTeal);
  rect(0, 100, width, height - 250);

  //REDRAW BRICKS
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }

  //REDRAW BALL
  fill(white);
  noStroke();
  circle(bx, by, bd);

  fill(darkTeal);
  circle( width/2, height - 125, 25);

  //FLASHING TEXT
  if (frameCount % 15 == 0) blink = !blink;

  if (lives > 0 && blink == true) {
    textSize(150);
    fill(red);
    text("YOU WIN!", width/2, height/2);
  } else if (blink == true) {
    textSize(150);
    fill(red);
    text("YOU LOSE.", width/2, height/2);
  }
}

void gameoverClicks() {
  reset();
  mode = INTRO;
  theme.loop();
}
