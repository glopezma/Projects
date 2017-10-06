class Tile {
  int x;
  int y;

  boolean occupied;
  boolean highlight;
  boolean jumpSwitch;
  boolean isKing;

  color tColor;
  color pColor;
  color jumpColor;

  Tile(int xpos, int ypos, boolean occ, color tileColor, color peiceColor) {
    x = xpos;
    y = ypos;
    occupied = occ;
    highlight = false;
    isKing = false;
    jumpSwitch = false;
    tColor = tileColor;
    pColor = peiceColor;
    jumpColor = color(131, 234, 239, 30);
  }

  void show() {
    if (highlight) {
      strokeWeight(5);
      stroke(255, 255, 0);
    }
    color fillColor = (jumpSwitch)? jumpColor: tColor;
    fill(fillColor);
    rect(x*tileSize, y*tileSize, tileSize, tileSize);
    strokeWeight(0);
    if (occupied) {
      fill(pColor);
      ellipse(x*tileSize+tileSize/2, y*tileSize+tileSize/2, tileSize/2, tileSize/2);
      if (isKing) {
        textSize(50);
        fill(0);
        text("k", x*tileSize+tileSize/2.5, y*tileSize+tileSize/1.5);
      }
    }
  }

  void reset(){
    occupied = false;
    highlight = false;
    isKing = false;
    jumpSwitch = false;
  }

  boolean clickedOn() {
    return (mouseX > this.x*tileSize && mouseX < this.x*tileSize+ tileSize && mouseY > this.y*tileSize && mouseY < this.y*tileSize+tileSize);
  }

  boolean clickable() {
    return (this.pColor == moveColor && this.occupied);
  }

  void crownKing() {
    if (this.pColor == grey && this.y == 0 || this.pColor == red && this.y == 7) {
      this.isKing = true; //move king over
    }
  }
}
//C:\Users\pl69798\AppData\Local\atom\bin