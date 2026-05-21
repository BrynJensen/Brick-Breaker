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
