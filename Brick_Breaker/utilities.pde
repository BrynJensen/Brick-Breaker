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
  px = random(width/2 - 45, width/2 + 45);
  py = height;
  bx = width/2;
  by = height - 125;
  bvx = 0;
  bvy = 1;
  score = 0;
  lives = 3;

  akey = false;
  dkey = false;

  int e = 0;
  while (e < n) {
    alive[e] = true;
    e++;
  }
}
