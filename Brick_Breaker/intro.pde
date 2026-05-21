void intro() {
  background(darkTeal);

  if (textS == true) {
    text = text + 1;
  }
  if (textS == false) {
    text = text - 1;
  }

  if (text > 120) textS = false;
  if (text < 40) textS = true;

  textSize(text);
  fill(white);
  text("Breakout!", width/2, height/2);

  textSize(30);
  fill(white);
  text("<Click to Start>", width/2, height/2 + 175);
}

void introClicks() {
  mode = GAME;
}
