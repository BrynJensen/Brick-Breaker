void game() {
  background(darkTeal);
  
  //DRAW PADDLE
  fill(white);
  circle(px, py, pd);



  //MOVE PADDLE
  if (akey == true) px = px - 8;
  if (dkey == true) px = px + 8;
  
  if (px < -1 * pd/2) px = width + pd/2;
  if (px > width + pd/2) px = -1 * pd/2;
}

void gameClicks() {
}
