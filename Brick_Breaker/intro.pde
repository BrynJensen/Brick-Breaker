void intro() {
  //GIF BACKGROUND
  image(gif[frame], 0, 0, width, height);
  if (frameCount % 3 == 0) frame++;
  if (frame == f) frame = 0;

  //CHANGE SIZE OF TEXT
  if (textS == true) {
    text = text + 1;
  }
  if (textS == false) {
    text = text - 1;
  }

  if (text > 120) textS = false;
  if (text < 40) textS = true;

  //TEXT
  textSize(text);
  fill(white);
  text("Breakout!", width/2, height/2 - 100);

  textSize(30);
  fill(white);
  text("<Click to Start>", width/2, height/2 + 175);
}

void introClicks() {
  mode = GAME;
}
