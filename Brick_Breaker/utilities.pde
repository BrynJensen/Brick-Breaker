void tactile(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(190);
  } else {
    fill(255);
  }
}

void squareButton(float x, float y, float w, float h) {
  tactile(x, y, w, h);
  strokeWeight(5);
  stroke(black);
  rect(x, y, w, h);
}

void reset() {
  theme.rewind();
}

void manageBrick (int i) {
     //set different colour as the row changes
    if (y[i] == 150) bc = lightOrange;
    if (y[i] == 225) bc = darkOrange;
    if (y[i] == 300) bc = maroon;
    if (y[i] == 375) bc = violet;
    if (y[i] == 450) bc = #FF0000;
    
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
    } 
}
