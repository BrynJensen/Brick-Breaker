void keyPressed() {
  if (key == 'a' || key == 'A' && mode == GAME) akey = true;
  if (key == 'd' || key == 'D' && mode == GAME) dkey = true;

}

void keyReleased() {
  if (key == 'a' || key == 'A' && mode == GAME) akey = false;
  if (key == 'd' || key == 'D' && mode == GAME) dkey = false;
}
