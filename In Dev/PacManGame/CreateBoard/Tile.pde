class Tile {
  int x;
  int y;
  boolean bigFood;   // b + mouse
  boolean smallFood; // s + mouse
  boolean wall;      // w + mouse
  boolean pac;       // p + mouse
  //reset backspace mouse

  Tile(int x, int y) {
    this.x = x;
    this.y = y;
    bigFood = false;
    smallFood = false;
    wall = (this.x == 0 || this.y == 0 || this.x == (numWidth - 1) * tileSize || this.y == (numHeight - 1) * tileSize)? true:false;
    pac = false;
  }

  //called from board class
  void show(Pacman pac) {
    show();
    if (smallFood) {
      score += 100;
      smallFood = false;
    }
    pac.show(x + pac.diam/4 + 2, y + pac.diam/4 + 1);
  }

  void show() {
    stroke(255, 255, 255, 25);
    strokeWeight(1);
    color mycolor = (wall)? color(68, 71, 76, 100): color(0, 19, 56);
    fill(mycolor);
    rect(x, y, tileSize, tileSize);
    if(!wall) {
      fill(255);
      if (smallFood) {
        ellipse(x + tileSize / 2, y + tileSize / 2, tileSize / 2, tileSize / 2);
      } else if (bigFood) {
        ellipse(x + tileSize, y + tileSize, tileSize, tileSize);
      }
    }
  }
}
